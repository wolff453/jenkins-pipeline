const sum = require('./index')

describe("Test", () => {
  it("Test sum", () => {
    expect(sum(1, 3)).toBe(4)
  })
})