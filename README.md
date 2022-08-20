# 作業割当メーカー
コンビニエンスストアの作業スケジュール作成アプリです。
カンタン作業登録機能でスケジュールを高速で作成することができます。
https://sagyouwariate-maker.herokuapp.com/

![create_new_22_v2](https://user-images.githubusercontent.com/95864276/185735792-0391ea38-5469-4586-a3a9-0ab9518fd178.gif)

<br>

## なぜ作ったのか
私は、某コンビニエンスストアチェーンに社員として新卒で入社し、直営店でお店の経営・運営について学んでおりました。その中で、チーム全体のタスクを管理することの難しさを痛感しました。店舗運営者がより効率的に、より質の高い店内体制の構築ができるようなツールを作成したいと考え、このアプリを作りました。

<br>

## こだわりポイント
### 1.ユーザーの手間をできる限り減らす
このアプリで最も達成したいことは、店舗運営者の労力の削減です。そのために、ユーザーはコンビニエンスストアの運営に必要な基本的な作業(72個)をデフォルトで呼び出せるようにしています。また、一から作業割当を作るのは面倒だと感じるユーザーのために、コンビニエンスストアのベーシックな一日の作業スケジュールを呼び出せるようにしています。

### 2.適正な人員配置を常に実現する
適正な人員配置を常に実現するためには、スケジュールの更新をより簡単にする必要があると考えました。そのために、CRUD機能に加えて作業割当の複製機能を追加しました。これによって、ユーザーは前の作業割当のデータを残しつつ、修正を加えて新しい作業割当を作成することができます。

### 3.ユーザビリティ
①店舗運営者の労力を削減する。
②店内体制の質を向上させる。

この二つの目的を達成するために、アプリは誰にとっても分かりやすく、使いやすいものにしたいと考えました。ユーザーが使い方を確認できるよう、操作ガイドのページを実装しております。PCの操作に慣れていない人のために、作業割当詳細ページには印刷ボタンを実装し、それについての説明も追加しております。ユーザーは作成した作業割当を簡単に出力・印刷し、使用することができます。


<br>


## 使用技術
- Ruby 2.5.7
- Ruby on Rails 6.1.6
- PostgreSQL 1.1
- RSpec 
- RuboCop

<br>

## ER図
![portfolio_er](https://user-images.githubusercontent.com/95864276/185769573-dc4a59c7-aa41-4542-bafb-6a95fa41f6c6.jpg)

<br>

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 作業割当管理
    - 作成
        - 登録済み作業呼び出し
        - サンプルデータ呼び出し
    - 読み込み
        - 印刷ボタン
    - 更新
    - 複製
    - 削除
- 呼び出し作業管理
    - 作成
    - 更新
    - 削除
