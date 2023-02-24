// Implement test with jest to check if the URL https://octodex.github.com/atom.xml is responding with a 200 status code.

it('should return a 200 status code', async () => {
  const response = await fetch('https://octodex.github.com/atom.xml');
  expect(response.status).toBe(200);
});