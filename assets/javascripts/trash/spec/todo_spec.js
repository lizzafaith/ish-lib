

//  it("validates when text field loses focus", function() {
//    loadFixtures("order_form.html");
//    $("#card_number").validateCreditCardNumber();
//    $("#card_number").val("123");
//    $("#card_number").blur();
//    expect($("#card_number_error")).toHaveText("Invalid credit card number.");
//    $("#card_number").val("4111 1111-11111111");
//    $("#card_number").blur();
//    expect($("#card_number_error")).toHaveText("");
//  });



$(document).ready(function() {
  describe('new_item', function() {
    it('should create a new item', function() {
      expect(new_item(0)).toEqual(1)
    })
  })

  describe('delete_todo', function() {
    it('should delete a todo', function() {
      idx = 5
      expect(delete_item(idx)).toEqual(1)
    })
  })
})


