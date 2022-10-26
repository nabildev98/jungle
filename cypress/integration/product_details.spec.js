describe('Visiting the home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Should navigate to product detail page when product is clicked', () => {
    cy.get('.products article').last().click();
    cy.url().should('include', '/products/1');
  });
});