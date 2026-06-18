

export interface Product {
  id: number;
  title: string;
  description: string;   
  oldPrice: number;
  price: number;
  brand: string;
  imageUrl: string;
  isNew: boolean;
  category: CategoryDTO; 
  deactivated: boolean;
}


export interface CategoryDTO {
  id: number;
  name: string;
}



export interface newProduct {
  title: string;
  description: string;   // NON "des"
  oldPrice: number;
  price: number;
  brand: string;
  imageUrl: string;
  isNew: boolean;
  category: CategoryDTO; // NON string
}

