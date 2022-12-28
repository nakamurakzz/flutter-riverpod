# flutter-riverpod
riverpodを完全に理解するためのリポジトリ

# 所感
- Provider, StateNotifierProvider, StreamProvider, FutureProviderを使うことが多くなりそう
  - Provider
    - 外部から状態を変更できない
  - StateNotifierProvider
    - 外部から状態を変更できる
    - StateNotifierのサブクラスを作る必要がある
    - サブクラスの中で状態を変更するメソッドを作り、それを呼び出すことで状態を変更する
      - StateProviderとの違いは、状態を変更するメソッドを作る必要があるかどうか
      - StateProviderと比較して、より安全に状態を変更できる
  - StreamProvider
    - Streamを扱うときに使う
    - ファイルの読み込み、Web APIの呼び出し等で使う
  - FutureProvider
    - Futureを扱うときに使う
    - NativeのAPIやWeb API呼び出し等で使う

- 外部からデータを入力する時は、Provider.familyを使う
  - Provider.family<レスポンスの型, パラメータの型>

- 画面遷移時に状態をクリアしたい場合は、autoDisposeを使用する
  - autoDisposeを使用する場合も.keepAliveを使用することで、画面遷移時に状態をクリアしないことができる -> 使う？