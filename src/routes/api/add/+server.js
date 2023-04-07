import { db } from '../../../db.js';
import { json } from '@sveltejs/kit';

export async function POST({ request }) {
  try {
    const { title, description } = await request.json();
    const [result] = await db.promise().query('INSERT INTO tasks (title, description) VALUES (?, ?)', [title, description]);
    const [task] = await db.promise().query('SELECT * FROM tasks WHERE id = ?', [result.insertId]);
    return json(task);
  } catch (error) {
    return {
      status: 500,
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        error: 'Internal post Server Error'
      }
    };
  }
}


