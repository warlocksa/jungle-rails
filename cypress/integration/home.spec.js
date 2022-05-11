
describe('jungle-rails', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There is sold out bages on the page when quantity is zero", () => {
    cy.get(".products article").should("have.length", 12);
  }); 
})