import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor CoffeeCannister {
  // Data structure to store coffee product information
  type Product = {
    id: Nat;
    name: Text;
    description: Text;
    price: Nat;
    farmId: Nat;
    certifications: [Text];
    quantity: Nat;
  };

  // Array to store all products
  var products: [Product] = [];

  // Function to add a new product
  public func addProduct(name: Text, description: Text, price: Nat, farmId: Nat, certifications: [Text], quantity: Nat): async Nat {
    let newProduct: Product = {
      id = products.size();
      name;
      description;
      price;
      farmId;
      certifications;
      quantity;
    };
    products := Array.append(products, [newProduct]);
    return newProduct.id;
  };



  // Function to verify product information
  public func verifyProduct(productId: Nat): async ?Product {
    for (product in products.vals()) {
      if (product.id == productId) {
        return ?product;
      }
    };
    return null;
  };



  // Function to get all products from a farm
  public func getProductsFromFarm(farmId: Nat): async [Product] {
    var results: [Product] = [];
    for (product in products.vals()) {
      if (product.farmId == farmId) {
        results := Array.append(results, [product]);
      }
    };
    return results;
  };
}