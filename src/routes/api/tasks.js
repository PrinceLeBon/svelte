
export async function getTasks() {
  const response = await fetch('/api/get');
  const tasks = await response.json();
  return tasks;
}

export async function addTask(task) {
  const response = await fetch('/api/add', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(task)
  });
  const newTask = await response.json();
  return newTask;
}

export async function updateTask(task) {
  const response = await fetch('/api/put', {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(task)
  });
  const updatedTask = await response.json();
  return updatedTask;
}

export async function deleteTask(task) {
  const response = await fetch('/api/del', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(task)
  });
  return response.ok;
}