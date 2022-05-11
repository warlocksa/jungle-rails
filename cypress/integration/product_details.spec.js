describe('jungle-rails', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is sold out button when quantity is zero", () => {
    cy.get(".soldout").should("be.visible");
  });

  it("There is add button on the page", () => {
    cy.get(".add-to-cart").should("be.visible");
  });
})