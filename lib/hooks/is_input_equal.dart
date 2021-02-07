isInputEqual(List preInputs, List curInputs) {
  if (preInputs == null || curInputs == null) {
    return false;
  }

  for (int i = 0; i < preInputs.length; i++) {
    if (preInputs[i] != curInputs[i]) {
      return false;
    }
  }
  return true;
}
