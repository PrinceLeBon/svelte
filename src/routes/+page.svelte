<script>
	import { onMount, onDestroy } from 'svelte';
	import {
		getTasks,
		addTask,
		updateTask,
		deleteTask
	} from '/src/routes/api/tasks';

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

<div class="row justify-content-between ">
	<div class="col-md-4 mt-4">
		<h2>Ajouter une tâche</h2>

		<div class="card row mt-4 pt-2 shadow">
			<div class="card-body">
				<form on:submit={handleSubmit} class="">
					<div class="row align-items-center">
						<label class="col-md-4 form-label">Titre de la tâche</label>
						<div class="col-md-8">
							<input type="text" bind:value={title} class="form-control form-control-sm"/>
						</div>
					</div>
					<div class="row mt-2 align-items-center">
						<label class="col-md-4">Description de la tâche</label>
						<div class="col-md-8">
							<input type="text" bind:value={description} class="form-control form-control-sm"/>
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-sm btn-primary mt-3">Ajouter</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-7 mt-4">
		<div class="row justify-content-end">
			<h2 class="mb-2">Liste des tâches</h2>

			<div class="col-md-12 card shadow mt-2 pt-2">
				<div class="card-body">

					<table class="table table-sm">
						<tbody>
							<tr class="text-uppercase fs-7">
								<th scope="col"></th>
								<th scope="col">Titre de la tâche</th>
								<th scope="col">Description</th>
								<th scope="col">Actions</th>
							</tr>
						  {#each tasks as task (task.id)}
							<tr class="">
								<td class="">
									<div class="form-check">
										<input class="form-check-input"
											type="checkbox"
											bind:checked={task.completed}
											on:change={() => handleUpdateTask(task)}
											/>
									</div>
								</td>
								<td>
									<input type="text" bind:value={task.title} class="form-control form-control-sm" />
								</td>
								<td>
									<input type="text" bind:value={task.description} class="form-control form-control-sm"/>
								</td>
								<td class="d-flex d-inline">
									<button class="btn btn-sm btn-outline-primary" on:click={() => handleUpdateTask(task)}><i class="fa fa-edit text-"></i></button>
									<button class="btn btn-sm btn-outline-danger mx-1" on:click={() => handleDeleteTask(task)}><i class="fa fa-trash "></i></button>
								</td>
							</tr>
						{/each}
						</tbody>
					</table>
				</div>
				
			</div>
			
		</div>
	</div>
</div>






