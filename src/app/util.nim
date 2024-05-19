import std/options
import std/os
import std/strformat
import std/strutils
import std/times
import std/typetraits

#Utils

template alias*(newName: untyped, call: untyped) =
  template newName(): untyped {.redefine.} = call


func first*[T](iterable: T): auto =
  for v in iterable:
    return v.some


proc currentLocalDatetimeString*(): string =
  now().format("yyyy-MM-dd HH:mm:ss")


func isValidFilename*(filename: string): bool =
  const MaxLen = 259
  const InvalidFilenameChars = {'/', '\\', ':', '*', '?', '"', '<', '>',
                                '|', '^', '\0'}

  if filename.len == 0 or filename.len > MaxLen or
    filename[0] == ' ' or filename[^1] == ' ' or filename[^1] == '.' or
    find(filename, InvalidFilenameChars) != -1: false
  else: true


proc findUniquePath*(dir: string, name: string, ext: string): string =
  var n = 1
  while true:
    let path = dir / fmt"{name} {n}".addFileExt(ext)
    if fileExists(path): inc(n)
    else: return path

proc `*`*(a: int, b: float): cfloat =
  cfloat(a) * b