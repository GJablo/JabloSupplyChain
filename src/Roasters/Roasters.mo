import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor RoasterCannister {
  // Data structure to store roaster information
  type Roaster = {
    id: Nat;
    name: Text;
    batches: [Batch];
  };

  // Data structure to store coffee batch information
  type Batch = {
    id: Nat;
    roasterId: Nat;
    batchName: Text;
    quantity: Nat;
    roastLog: Text;
  };

  // Array to store all roasters
  var roasters: [Roaster] = [];

  // Function to register a new roaster
  public func registerRoaster(name: Text): async Nat {
    let newRoaster: Roaster = {
      id = roasters.size();
      name;
      batches = [];
    };
    roasters := Array.append(roasters, [newRoaster]);
    return newRoaster.id;
  };

  // Function to purchase beans from a farm
  public func purchaseBeans(farmId: Nat, batchId: Nat, quantity: Nat): async () {
    let farmCannister: actor { purchaseBeans: (Nat, Nat, Nat) -> async () } = actor("farm_cannister_id");
    await farmCannister.purchaseBeans(farmId, batchId, quantity);
  };


}