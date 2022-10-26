describe('Visiting the home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Cart size indicator changes after product is added", () => {
    cy.get('.btn').last().click({force: true})
    cy.url().get('.end-0').should("contain.text", "1")
  })
})