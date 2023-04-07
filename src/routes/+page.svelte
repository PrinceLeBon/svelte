<script>
	import { onMount, onDestroy } from 'svelte';
	import {
		getTasks,
		addTask,
		updateTask,
		deleteTask
	} from '/home/phantom/Documents/Ajax/app/src/routes/api/tasks';

	let tasks = [];
	let title = '';
	let description = '';

	const loadTasks = async () => {
		tasks = await getTasks();
	};

	onMount(loadTasks);
	onDestroy(() => {
		// Annule toutes les requêtes en cours lors de la destruction du composant
		// afin d'éviter des mises à jour de l'état après la destruction
		/* getTasks.cancel();
      addTask.cancel();
      updateTask.cancel();
      deleteTask.cancel();*/
	});

	const handleAddTask = async (newTask) => {
		const addedTask = await addTask(newTask);
		const updatedTasks = await getTasks();
		tasks = updatedTasks;
		title = '';
		description = '';
	};

	const handleSubmit = async (event) => {
		event.preventDefault();
		if (title.trim() && description.trim()) {
			const newTask = { title, description };
			await handleAddTask(newTask);
		}
	};

	const handleUpdateTask = async (updatedTask) => {
		const index = tasks.findIndex((task) => task.id === updatedTask.id);
		tasks[index] = updatedTask;
		await updateTask(updatedTask);
	};

	const handleDeleteTask = async (deletedTask) => {
		await deleteTask(deletedTask);
		tasks = tasks.filter((task) => task.id !== deletedTask.id);
	};
</script>

<h1>Ajouter une tâche</h1>

<form on:submit={handleSubmit}>
	<label>
		Titre de la tâche :
		<input type="text" bind:value={title} />
	</label>
	<label>
		Description de la tâche :
		<input type="text" bind:value={description} />
	</label>
	<button type="submit">Ajouter</button>
</form>

<h1>Liste des tâches</h1>

<ul>
	{#each tasks as task (task.id)}
		<li>
			<input
				type="checkbox"
				bind:checked={task.completed}
				on:change={() => handleUpdateTask(task)}
			/>
			<input type="text" bind:value={task.title} />
			<input type="text" bind:value={task.description} />
			<button on:click={() => handleUpdateTask(task)}>Modifier</button>
			<button on:click={() => handleDeleteTask(task)}>Supprimer</button>
		</li>
	{/each}
</ul>
