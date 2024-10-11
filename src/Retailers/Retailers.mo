import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor RetailerCannister {
  // Data structure to store retailer information
  type Retailer = {
    id: Nat;
    name: Text;
    inventory: [InventoryItem];
  };

  // Data structure to store inventory item information
  type InventoryItem = {
    id: Nat;
    retailerId: Nat;
    coffeeId: Nat;
    quantity: Nat;
  };

  // Array to store all retailers
  var retailers: [Retailer] = [];

  // Function to register a new retailer
  public func registerRetailer(name: Text): async Nat {
    let newRetailer: Retailer = {
      id = retailers.size();
      name;
      inventory = [];
    };
    retailers := Array.append(retailers, [newRetailer]);
    return newRetailer.id;
  };

  // Private helper functions
  private func getRetailer(retailerId: Nat): ?Retailer {
    for (retailer in retailers.vals()) {
      if (retailer.id == retailerId) {
        return ?retailer;
      }
    };
    return null;
  };
}