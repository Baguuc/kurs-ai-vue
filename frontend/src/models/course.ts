import type { Module } from './module.ts';
import type { Episode } from './episode.ts';

type Course = {
  name: string;
  modules: Module[];
};

async function listCourses(): Promise<Course[]> {
  const response = await fetch("http://localhost:8000/courses");
  const json: Course[] = await response.json();
  
  const sorted = json.map(course => {
    const modules = course
      .modules
      .map(module => {
        module
          .episodes
          .sort((a: Episode, b: Episode) => parseInt(a.no) - parseInt(b.no));
        
        return module;
      });
    modules.sort((a: Module, b: Module) => parseInt(a.no) - parseInt(b.no));
    
    return { ...course, modules  }; 
  });

  return sorted;
}

async function fetchCourse(id: number): Promise<Course> {
  const response = await fetch(`http://localhost:8000/courses/${id}`);
  if(response.status == 404) {
    throw new Error("Not found");
  }
  const json: Course = await response.json();
  
  const modules = json
    .modules
    .map(module => {
      module
        .episodes
        .sort((a: Episode, b: Episode) => parseInt(a.no) - parseInt(b.no));
      
      return module;
    });
  modules.sort((a: Module, b: Module) => parseInt(a.no) - parseInt(b.no));
  
  const sorted = { ...json, modules };

  return sorted;
}

export { listCourses, fetchCourse };
export type { Course };
