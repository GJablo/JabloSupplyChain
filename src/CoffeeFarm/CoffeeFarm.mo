import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor FarmCannister {
  // Data structure to store farm information
  type Farm = {
    id: Nat;
    name: Text;
    batches: [Batch];
  };

    type Product = {
    id: Nat;
    name: Text;
    description: Text;
    price: Nat;
    farmId: Nat;
    certifications: [Text];
    quantity: Nat;
  };

  // Data structure to store coffee batch information
  type Batch = {
    id: Nat;
    farmId: Nat;
    batchName: Text;
    quantity: Nat;
  };

    // Array to store all products
  var products: [Product] = [];

  // Array to store all farms
  var farms: [Farm] = [];

  // Function to register a new farm
  public func registerFarm(name: Text): async Nat {
    let newFarm: Farm = {
      id = farms.size();
      name;
      batches = [];
    };
    farms := Array.append(farms, [newFarm]);
    return newFarm.id;
  };

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

  // Function to get a farm by ID
  private func getFarm(farmId: Nat): ?Farm {
    for (farm in farms.vals()) {
      if (farm.id == farmId) {
        return ?farm;
      }
    };
    return null;
  };
}