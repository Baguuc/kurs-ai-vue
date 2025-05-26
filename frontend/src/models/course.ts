import type { Module } from './module.ts';

type Course = {
  name: string;
  modules: Module[];
};

async function listCourses(): Promise<Course[]> {
  const response = await fetch("http://localhost:8000/courses");
  const json: Course[] = await response.json();

  return json;
}

async function fetchCourse(id: number): Promise<Course> {
  const response = await fetch(`http://localhost:8000/courses/${id}`);
  if(response.status == 404) {
    throw new Error("Not found");
  }
  const json: Course = await response.json();

  return json;
}

export { listCourses, fetchCourse };
export type { Course };
