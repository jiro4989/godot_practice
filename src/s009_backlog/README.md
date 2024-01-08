# s009_backlog

## クラス図

```mermaid
classDiagram
    class ConversationText {
        -String actorName
        -String text
        -String actorImage
        -String soundEffect
        -String bgm
        -Boolean isViewed
        -Boolean isNeededNewPage
        -String destinationId
        -List~Choice~ choices
        +getText() String
        +getActorImage() String
        +getIsViewed() Booleana
        +getIsNeededNewPage() Boolean
        +viewed()
        +selectChoices(Int index)
    }
    class ConversationBlock {
        -String id
        -List~ConversationText~ conversationTexts
        -Int position
        +next()
        +getConversationText() ConversationText
    }
    class Conversations {
        -ConversationBlock conversationBlock
        -DisplayConversation displayConversation
        -Backlog backlog
        +loadConversationBlock(String id)
        +nextConversation()
    }
    class DisplayConversation {
        -String actorName
        -String text
        +append(ConversationText)
        +clear()
    }
    class Choice {
        -String text
        -String destinationId
        +getText() String
        +getDestinationId() String
    }
    class Backlog {
        -List~ConversationText~ conversationTexts
        -Int MAX_BACKLOG_SIZE
        +append(ConversationText)
    }

    Conversations ..o ConversationBlock
    Conversations ..o DisplayConversation
    Conversations ..o Backlog
    ConversationBlock ..o ConversationText
    ConversationText ..o Choice
    DisplayConversation ..o ConversationText
    Backlog ..o ConversationText
```

## クラス説明

### Conversations

すべての会話を管理するマネージャクラス。
UI からはこの Conversations オブジェクトを介して操作する。

### ConversationBlock

ConversationText をある程度まとめたブロック。
ConversationBlock は必ず ID を持っており、ID で次の ConversationBlock がきまる。
つまり、ID で連鎖するチェーン構造になっている。

### DisplayConversation

画面上に表示する会話。

### Backlog

過去に表示された会話のログ。

### ConversationText

1人の人物が一度におこなう会話を表現するオブジェクト。
`destinationId` は次の ConversationBlock を示す。

### Choice

選択肢オブジェクト。