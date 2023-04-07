import { db } from '../../../db.js';
import { json } from '@sveltejs/kit';

export async function PUT({ request }) {
  try {
    const { id, title, description, completed } = await request.json();
    await db.promise().query('UPDATE tasks SET title = ?, description = ?, completed = ? WHERE id = ?', [title, description, completed ? 1 : 0, id]);
    const [task] = await db.promise().query('SELECT * FROM tasks WHERE id = ?', [id]);
    return json(task);
  } catch (error) {
    return {
      status: 500,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        error: 'Internal PUT Server Error'
      }
    };
  }
}
