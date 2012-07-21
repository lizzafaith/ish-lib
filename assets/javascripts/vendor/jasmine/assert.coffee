((exports) ->
  exports.assert = exports.expect =
    # ok(value, [message]) - Tests if value is a true value.
    ok: (value) ->
      expect(value).toBeTruthy()
      
    notOk: (value) ->
      expect(value).toBeFalsy()
    
    # equal(actual, expected, [message]) - Tests shallow, coercive equality with the equal comparison operator ( == ).
    equal: (actual, expected) ->
      expect(expected).toEqual actual
      
    # notEqual(actual, expected, [message]) - Tests shallow, coercive non-equality with the not equal comparison operator ( != ).
    notEqual: (actual, expected) ->
      expect(expected).toNotEqual actual
      
    # deepEqual(actual, expected, [message]) - Tests for deep equality.
    # notDeepEqual(actual, expected, [message]) - Tests for any deep inequality.
    # strictEqual(actual, expected, [message]) - Tests strict equality, as determined by the strict equality operator ( === )
    # notStrictEqual(actual, expected, [message]) - Tests strict non-equality, as determined by the strict not equal operator ( !== )
    # throws(block, [error], [message]) - Expects block to throw an error.
    throws: (error, block) ->
      expect(block).toThrow(if typeof error == "string" then new Error(error) else error)
      
    # doesNotThrow(block, [error], [message]) - Expects block not to throw an error.
    doesNotThrow: (error, block) ->
      expect(block).toThrow(if typeof error == "string" then new Error(error) else error)
      
    includes: (haystack, needles) ->
      for key, value of needles
        expect(value).toEqual haystack[key]
    
    contains: (needle, haystack) ->
      expect(haystack).toContain needle
    
  exports.assertEquals = (expected, actual) ->
    
  exports.assertNotEquals = (expected, actual) ->
    expect(expected).toNotEqual actual
  exports.assertTrue = (value) ->
    expect(value).toBeTruthy()
  exports.assertFalse = (value) ->
    expect(value).toBeFalsy()
  exports.assertNotUndefined = (value) ->
    expect(value).toBeDefined()
  exports.assertUndefined = (value) ->
    expect(value).not.toBeDefined()
  exports.assertArrayEquals = (expected, actual) ->
    assertEquals expected, actual
  exports.assertObjectEquals = (expected, actual) ->
    delete actual["_"]
    assertEquals expected, actual
  exports.assertContains = (needle, haystack) ->
    expect(haystack).toContain needle
  exports.assertNotNull = (value) ->
    expect(value).not.toBeNull()
  exports.assertNull = (value) ->
    expect(value).toBeNull()
    
    
)(if typeof window == "undefined" then global else window)
