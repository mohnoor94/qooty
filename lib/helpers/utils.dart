List<int> assureInts(List list) => list == null ? List<int>() : list.cast<int>();

T safelyReturn<T>(Function isSafeProvider, T Function() safeValueProvider, T Function() defaultValueProvider) =>
    isSafeProvider() ? safeValueProvider() : defaultValueProvider();
