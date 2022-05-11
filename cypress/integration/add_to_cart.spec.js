describe('jungle-rails', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("There is no products in the cart", () => {
    cy.get("#cart").contains(0);
  });

  it("Quantity shall add one when click add item ", () => {
    cy.get('button.add-to-cart').first().click({ force: true })
      cy.get("#cart").contains(1);
  });
})