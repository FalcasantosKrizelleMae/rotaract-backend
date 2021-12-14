
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


use heroku_4c7d942fdcea2e2;

CREATE TABLE `attendance` (
  `id` int(10) NOT NULL,
  `member_id` int(10) NOT NULL,
  `event_id` int(10) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `log` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `attendance` (`id`, `member_id`, `event_id`, `status`, `log`) VALUES
(4664, 87456452, 43415, 'present', '2021-12-13 12:37:36');


CREATE TABLE `clubs` (
  `club_id` int(11) NOT NULL,
  `club_name` int(11) NOT NULL,
  `img` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `no_of_members` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `donations` (
  `id` int(20) NOT NULL,
  `amount` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `donated_by` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `events` (
  `event_id` int(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'N/A',
  `platform` varchar(255) NOT NULL DEFAULT 'N/A',
  `link` varchar(255) NOT NULL DEFAULT 'N/A',
  `participants` int(255) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT 'N/A',
  `venue` varchar(255) NOT NULL DEFAULT 'N/A',
  `source` varchar(255) NOT NULL DEFAULT 'N/A',
  `total_cost` float NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT 'N/A',
  `chairperson` varchar(255) NOT NULL DEFAULT 'N/A',
  `prepared_by` varchar(255) NOT NULL DEFAULT 'N/A',
  `created_at` datetime DEFAULT current_timestamp(),
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `chapter` varchar(255) NOT NULL,
  `backgroundColor` varchar(255) NOT NULL DEFAULT '#d91b5c',
  `borderColor` varchar(255) NOT NULL DEFAULT '#d91b5c'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `events` (`event_id`, `title`, `start`, `end`, `description`, `type`, `platform`, `link`, `participants`, `host`, `venue`, `source`, `total_cost`, `email`, `chairperson`, `prepared_by`, `created_at`, `status`, `date_created`, `chapter`, `backgroundColor`, `borderColor`) VALUES
(43415, 'Event for WMSU', '2021-12-15 14:39:00', '2021-12-15 17:44:00', 'Evnt for wmsi', 'virtual', 'Google Meet', 'https://meet.google.com', 0, 'John Doe', 'N/A', 'N/A', 0, 'john@gmail.com', 'N/A', 'N/A', '2021-12-12', 'accepted', '2021-12-12 13:39:41', 'Western Mindanao State University (WMSU)', '#d91b5c', '#d91b5c'),
(834591, 'Event for all', '2021-12-13 09:00:00', '2021-12-13 13:30:00', 'Event for all desc', 'virtual', 'Google Meet', 'https://meet.google.com', 0, 'John Doe', 'Gymnasium', 'Funds', 1000, 'ejoib78@gmail.com', 'John Doe', 'Yvan Joe', '2021-12-12', 'pending', '2021-12-12 13:34:04', 'all', '#d91b5c', '#d91b5c');



CREATE TABLE `funds` (
  `id` int(50) NOT NULL,
  `club_id` int(50) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `total_funds` double NOT NULL DEFAULT 0,
  `expenses` double NOT NULL DEFAULT 0,
  `donations` double NOT NULL DEFAULT 0,
  `no_of_donations` int(50) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `funds` (`id`, `club_id`, `club_name`, `total_funds`, `expenses`, `donations`, `no_of_donations`) VALUES
(1, 0, 'Zamboanga City West', 0, 0, 0, 0),
(2, 0, 'Zamboanga City North', 0, 0, 0, 0),
(3, 0, 'Zamboanga City East', 0, 0, 0, 0),
(4, 0, 'Metro Zamboanga', 0, 0, 0, 0),
(5, 0, 'Western Mindanao State University (WMSU)', 0, 0, 0, 0),
(6, 0, 'Universidad De Zamboanga - CES', 0, 0, 0, 0);


CREATE TABLE `members` (
  `member_id` int(8) NOT NULL,
  `qrcode` mediumtext NOT NULL,
  `first_name` varchar(225) NOT NULL,
  `last_name` varchar(225) NOT NULL,
  `date_started` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `balance` int(100) NOT NULL DEFAULT 0,
  `role` varchar(225) NOT NULL,
  `chapter` varchar(225) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'new',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `members` (`member_id`, `qrcode`, `first_name`, `last_name`, `date_started`, `email`, `balance`, `role`, `chapter`, `status`, `date_created`) VALUES
(23135789, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAXNSR0IArs4c6QAABL5JREFUeF7tnctu4zAQBOP//2gvsDdJCxcaPZIZbuU6JDXsmgcly87r/X6/f/zbRoGXQLdh+XcjAt2Lp0A34ylQge6mwGb7sYcKdDMFNtuOGSrQzRTYbDtmqEA3U2Cz7ZihAt1Mgc22Y4YKdDMFNttOnaGv1+tRSejj27M/5/Hkbzp+evO0P7qeQE8KCdQMpaSJ7GboSS5LbhkSJGAUnv8YTOuT/bxk20NLuS47TP0nPcd76NMbTgURKIREKihFGGUUHVoooAQq0IMCFDDTARuv177GSRlKGXF2eDoDCUDqP/lHAGg++Uvr395DBXpEINDTfS5FMGXcdI9+OmDNUPimBwVAaifBzdAyQ0ngtoeboaBwG8GpwAIdftTWCko90QwNFVitx5ihdGwsHyykAqcllwIqzeD2+pQP6fq03mV/v/3BgkCPSH/9gwWBCvRjFUtL4t0tZbmSmzpEPY9afitwe/10v2mFofVvL7nkANnTDQuUQr485RIwsguUFHq4h2buXEcLNFNwvORml89Ht4eWdn7ucTajLJj9j2akPSvb3nV0C6Sd3/pP8wUKn8ZQyU7tBKS1C1Sghxiqe2gbkc6fVUCgs3p+fTWBfh3BrAMCndXz66vVQNNTYnvbQKdAuo1Kr0+EaP/n+el4uv5l/ac/D00FTQUQKIV8+SyXgLR2yoCzPQ0oyhDyn/wr5b+4Z8kNXxNtAaUBQAF1e8mljCAH0w1Pj6f1yE77awOC1h/PUIGS5Ef7eIBMH4oEKtCDAmnETo+n9cie4fz5GV+vzVDaQOtwOp9uW6iCPD2f/CF9xw9FdMEUSHtoeBoI3QaRPgINvx5IgrZA2vkCFejHGK1vW6hEUgRSiaQMSJ+00PVaf6kikD3dz+09lAQjQKmgqQDkX3p9ApTa0/0INPxtwjQAU4AUQOl6llxQ7L8DSrclZG97MEUwldgW2PR82g/Z6wwlYGQX6Oz/4xXo6TaIMpp6XjufMpDsAhUoxcizdirpZCdv2/nUUtrblNtvW0igaTsJTnbyp50vUFL4ZCfByU6Xa+cLlBQW6EeFxg9FIY94OPWcNKPS8dMZ115/vIemx/SY4GmCQD8raIY+/BrndIaboWEPporSlsx2/u1AqSSSQNMR3Ao2PZ/23+o3XnJbhwTaPdsVKKSMGQrv/FDJMUMXz9D0toY+XyT7OSCoBVAGftseJ0D7onW6YXKQgJFdoBTCZY8xQ4//AZkCssQx/0ti5LAZeuyRVOFIr8fvQ+/O0PQQRQJO2wlIm5ECXeyXxwQafhWCWsDddjMU3vGhiJ4umS1wgYZAqUd/G0gbYBQQ2/VQgR6R3v4slwSnBwFphN+9Hq0/feo2Q08KWHLDkKAMCpe7DE/XTysC+UcBkc6n8a399pJbOxi+IiJQug8on+UKtPs4LNXPDAXF/vuSm0ZUOp4EJjudUtOSTQWOzgBkT/UZz9DUgXQ8ASO7QMMemgJKxxMwsgtUoB8V2K7kphnm+HsVqHvove65eqqAQFPFFh8v0MUBpe4JNFVs8fECXRxQ6p5AU8UWHy/QxQGl7gk0VWzx8QJdHFDqnkBTxRYfL9DFAaXuCTRVbPHxAl0cUOqeQFPFFh8v0MUBpe79Aamgkw7hzbE5AAAAAElFTkSuQmCC', 'Joya', 'Falcasantos', '2021-12-05', 'mertozc@gmail.com', 100, 'Member', 'Metro Zamboanga', 'new', '2021-12-07 11:58:56'),
(34256786, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAXNSR0IArs4c6QAABOxJREFUeF7tndGSIykMBO3//2hvxL01jpi8jII2xrWvAiEqJUF3z+w8X6/X69F/xyjwLNBjWP63kQI9i2eBHsazQAv0NAUO20/P0AI9TIHDttMKLdDDFDhsO63QAj1MgcO20wot0MMUOGw7rdACPUyBw7YTV+jz+bxVkvHz7bj+avvqzaafpwt0SEhKiAKdrAAJvto+eTtv7lqhssJS4D8HNM2wUTB7Ro7zKR7rn/xZ4LS+9pf+TNHsgAo0+5m96ZeiuzOYbtkUDyUk2W0F2YS1/gs0PIOt4F8PlCqIzjyqEPJPl6DV66f+bcIsr1ASPN0w+S9QmRJpBRXo9U0bnfmEpxU6KEQVTXYSnOb/PFC6ZJDAqztE6t/G//UVWqBXBQq0LXfICPkcRy0kPWPo1jt7fbteuj+K/+sr1N6yraDWPwlu1yd/b0fO6ne5qzPYCm4Ftf4JgF2f/BXo8AvrFhgBIQA0/+cfW2YDsYKv7kCUILdXqA2IHkMog63Adz8npvsjPZdfiigAslMFkkDkv0AHBazgVmDrvxVKPQwIWMEL1D3Ha71mP7bYAOz49NKSzrfx2vFhfeX/aUba4tINU4eYbbfx2vEFKl89tkLlGWoz0o5PgaTzbbx2/Mcr1Ab86fF0RKSCfnx/6aXo0xuw6xeoVWzz8QW6OSAbXoHKSxGdQSSoBUSv7sgfxWP3Q5cuiofWo/m3v8slASlgsltBKB7yZ59zZ8c/+itQ+A30AoX/8ZwqgjKY7ATgLaML9G9JqQXNFpQAk53iTe20/mx73HIJEFUMVSzNTwVJgdH8ND47v0AXvwu2QNLxBVqg1xyilkN2ykhqyTTfPqfSeulzJsWbHjFxhRIwstMGSWCaX6BSIQJGdlquQEmhoWOmX1sIGNkp3AIlhRYDdcvz6PhMCV8ccIRuRJrgtNr0M5QWtPYCdYoV6M1/nLEVGgpOZ3DaAVz9PB7bA6UN0QZW2yk+slN86fzU/7h+3HJXb4g2THaKj+ypf5pPdoqvQKVCqeA0n+wy3Pwn52lBCni1neIjO8WXzk/9316htOHUTpce658uSQSA7G8A4OOAjX/5GWoDsuML9KpYgQ4Z1Aq1JTV5fCt0coXOFpR40/fI1E7rkz2tcPJP9rjlFuhV4gKllIMzjm6V1i7DeRteoFLBtKXSfBnO+UApQ61gd1fYGJ9NgNn713qt/okFG5B98F59hhdo+LmrQLMSmH7Lnd1y2nId4OVAbUukFkf22WcgxZ8mMCWsw/nIv7ZQQCSIBVCgfyNuhcrnXEpAXVG7fW1phYZ/TbBArwJSS09bNFUcrT+7ojGe1c+h6YbTDlCglAKDPRWcMjj1X6AFqhRIO5Ba7H8M/vpbLr1Zog5AGlGHsOvTevFz7befoVZQK1iBwt9FsRk6W9ACBQIkeHrGkP9W6FWB5WcoVSTZU6BpRdIZTPGldtLnLaFXn6E2IKo4AkQCUjzUUegxaLad4i1QeYS0Qm/+wJ1WNM3/eaC2Rdjx1NJSADYeGm9bOPkj+/RLES2Y2gv0bwULdPIRkbbwNOELtEDTHOr8lQrEFboyuPr2ChSo12zrGQW6NR4fXIF6zbaeUaBb4/HBFajXbOsZBbo1Hh9cgXrNtp5RoFvj8cEVqNds6xkFujUeH1yBes22nlGgW+PxwRWo12zrGQW6NR4f3D9wgycOqxzH5QAAAABJRU5ErkJggg==', 'Rupert', 'Sierra', '2021-12-01', 'krizzycabello@gmail.com', 0, 'Finance', 'Western Mindanao State University (WMSU)', 'new', '2021-12-04 11:09:46'),
(42374945, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAXNSR0IArs4c6QAABLRJREFUeF7tnUGOGzEMBOP/P9oBcvNs4EKjqbGlrVwlUWQXSWnGjvfxfD6ff/x3jAIPgR7D8l8gAj2Lp0AP4ylQgZ6mwGHxeIYK9DAFDgvHChXoYQocFo4VKtDDFDgsHCtUoIcpcFg4VqhAD1PgsHDqCn08HrdKQh/ftv5c7bf2UnEoPrIn0ItCArVCqWiicSv0IlfbIq3QS4W2GXZN5yugVvDUP9o/Kr//TJ62P36GpoKRIBRwWpGpf7Q/+U/j0/YFCopPC552IEqIH/bab/19OmAr9BXp8gptBf+2hJk+w6fjEyhc6kjwb0tYgQr00rNDQeiQp5aW3lJpv7QCyT/aj9a38R1XoQSIBE9vobZcULTNYIGWNU4C3p3B5I8VWj54C/RVwLYDUUJuf4amCUOCpIKn+6f2yd/b3xStDji1TwKlgqf7p/bJX4EOX8oE+mFBKePTCvp1QElAGk9vra3A6XMo+U/jaXxob/dPWwgACUBPbdOCk7/kD8Wz/JZLDtB4KqgVWqZEKjgBbDNYoMNAU2Dp/PbS0q5P/U3nlzj6H81IKyIN8Dq/BdKub/2n9QINP74TKKSUFUo1l41/vEIzd9fPXn1JWx9Bt0P92NJtP79aoG2NzzOpLApUoFUCfdviuuVSRaweJ0Hb/Vv77YsS2v+H/dXvcltBaT0FTOtpvLUv0MsPbK8WfLV9gQqUmsLb8foMbTOQXky0b3Y+vb59dZnSFWjYEahFTyeoQG9+t0sdwAq9KECCffv49kDpTE0DTOcT4NQetTzaj8bJH9p//DmUNmzPFAp49ZlG8REwGqf4aH+Bhi2dBCVgNC7Q8lZKAlJHSddvD5QEoQDTzwralttWIK1Px9P4l7dcgaYIX+cLNHzuTOWmjpLao/kCFehLjtSv/tIzrM34dn16qUkrivQge+24QOHWTAJTgrUtlPYfvxRRRqbjFAAJSOutUFAoBdYCadcLNE35m+dTQrXurLbf+jfecqcdSu2tFny1/TReml9fimiD1eOrBV9tf1ofgZZ3hGkgrb0aKL3qax2kSwzZpwqj8dQ+zadLXfuYI9DyjyCkCS3QS8qnGUwVSONUcQIlhWBcoO8FGm+5qeDEd7qCUv/a/X88J8Jfokr9G38OnQ6YBEgDbv1r11M87aVPoJeX8as7hEAvCrQV8un1xwFdfQskYJ8ev70D3P3/QynA9Dnt08Bof4q3XX/7GWqFwmNG+WJDoOX3etMOYoWGgpNgdClJAVGLbDtSGs9xFZoKkAJpgZN/6XM12Vv+pqjNWAJAAVqhoUIkuEDfC2qFlmfs6gSc7ghhfc3/Xi6dOeQgrU/HW4FTf9v92ord/gylimsFFujN30QX6GvKLa9QynAaT4FRRdJ+13Fq8WSvbaFk//bn0NQhApIKlN6yBTr8LlKgXQnYckG/X99yu/zi1SQwtWQ6k9MWPb0f2SOFxiuUNmzHBfpeQYEOP2aldwDqGGkBCFSgac44/04F6gq901n3YgUEyhptNUOgW+FiZwXKGm01Q6Bb4WJnBcoabTVDoFvhYmcFyhptNUOgW+FiZwXKGm01Q6Bb4WJnBcoabTVDoFvhYmcFyhptNUOgW+FiZ/8CK5h7Dhe8JQwAAAAASUVORK5CYII=', 'Angelique', 'Casale', '2021-12-08', 'casale@gmail.com', 0, 'Member', 'Zamboanga City North', 'new', '2021-12-07 06:50:34'),
(43562456, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAXNSR0IArs4c6QAABIpJREFUeF7tnUluxDAMBDP/f/QEyM024EKDlCwrlatoLV1sSl4G+Xy/3++Pf9so8BHoNiz/FiLQvXgKdDOeAhXobgpsth73UIFupsBmy9GhAt1Mgc2Wo0MFupkCmy1Hhwp0MwU2W44OFehmCmy2nLJDP5/PVEmqr2/P86X+Xre+6vvQ1y34lIACPflRoL0FihKMRrPkwhc4r0vY7pJbzbBzBtKeR4Kf51ONn70+cuRFL4EeJaEEEGiaYrBHk+Dn4brjBSrQWwVoS0nlaz8UpY5IHUUO6d4jSXAar3t9BFigcF8q0NNtwOwMpvGoglTbyUFp/9Tf9FMuCdxdkmi8VFAdurhDKeOrwLv7p/7+vUNJIIGGh4puQenJEo1XLflU4qv9p/P/d6dcEkiHPuxQOrSkDhaoQMn0h/Y0YaLOO34fSg4ZvcfQ+Do0TAkSVKBz3+YMPxSF+XEJp4Sh/imh0mfDFE/zoYpR7V+g4RcLVcEFGn7URYLRfSFdL9C0Bp3iLbmZgO0lNxs+j06P/ZQQaXs+4+yKagUQaPN9dIbvGi3QEEjV4VVgdL1ABXrIkXLJpYx7up32yKfn1z2+QLsVfbg/gT4MoHt4gXYr+nB/ZaC0R41upyc79GSI5kd80uvTeBr/sv7Rv22hBVTbBXpUQIc2Pyum+0hK4NSROhQ+MyUgVBHo+tcDTQVIF0zvOynjq0+O6PrRe/h0hwr0qAAlADmcEnT4HipQgR4UoIy15DafclMHpvEEjEoYlajZ19N4lMC0nnLJTQGl8QIlhDr0tqRTAqWn1jRehw7++SL5g0ro64BSRlPGVe87qX8q8U8DS9dP8y3voQKt3ZYItPnZK2X86JIqUIHe5mB7yaWMpnZyTHrIoP6q86E9vNuBtB6BNp+S6RBGCUDAqF2gAj09mWj+LpYy0JJ7r1DZoSmA7njao6id5pNen8bT+Gm7QEGxFFAanwKjeIEKlHJkbjs5gtpptun1aTyNn7aXHUqP/tIJUXz3sb8KIF0/3fdW1yfQxZ48CZQs3bxH0oMDmo4OPSlUzWACkva/fclNBaGMTve4NL57fEoYGq+qX/seWp0QCUL9C5QUGrwHUcamgNL47vEpIWm8Io4fHTo4Yat7LCXAJYFm/5yQJpieAquCkaOfbie9BBr++kygze8XU0Epo6sVYPb1tB4dqkPvc+RpB9GpcrajUj2qp9rtHCrQowLDb1tGn0IFKtCDAquV5PQQtF3JpT2r6mASmPZAmh+10/gCDb9SJEEFCgp1l0AdSil5aqeSMfpQROMLtBlo2N0lvAqsOj5VDOqfSjJdn7YPv21JJ5Q6iuKr4wsU/rFNKrAOzRTTocVDGsn9+pJLC6y2UwkkAcnx1UMcbQHV+ZN+7Q6lAavtVUEECgTSjBbo9yABJViqlw5tfiH/+pKbZpDxYxUoO3Ts9Ow9VUCgqWKLxwt0cUDp9ASaKrZ4vEAXB5ROT6CpYovHC3RxQOn0BJoqtni8QBcHlE5PoKlii8cLdHFA6fQEmiq2eLxAFweUTk+gqWKLxwt0cUDp9H4B8iLPDkAluzkAAAAASUVORK5CYII=', 'Yvan Joe', 'Tinguha', '2020-06-29', 'yvanjoe@gmail.com', 0, 'Secretary', 'Western Mindanao State University (WMSU)', 'new', '2021-12-12 08:51:27'),
(56456789, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAXNSR0IArs4c6QAABKhJREFUeF7tndFuhTAMQ+H/P5pJe6NIHFlOC+R6r23axI6TFti2H8dxbPlpg8AeQttw+R9ICO3FZwhtxmcIDaHdEGgWT3poCG2GQLNwotAQ2gyBZuFEoSG0GQLNwolCQ2gzBJqFE4WG0GYINAvHVui+70shGV/fjvvPHp8drPt6OoQOCUkJEUKLESDAZ48Xh3NZLgoVFeYS/nOEuhk2Aqb2yNFeJVDd3yWY4lPXL++hIVSjIIQOHynSKTsK1RJsq84wteSF0DNi00suAe72PFqfFDp7f3d9UV/+R2KkUALcDZjWD6FiSoRQ7UkZJZh7qEzJHRJYBZwqhFuBRH19v+TSIcoF9OkKFELhZYGrQLInAsj+50tuFNrs2hJCmxGq9ji15Knrp+QWnzJnE0brh9AQekLg5w9Fakkkhbnj7RVKAdI4EUb2sw9N6v7kz+sV+rqAi++pr4vP/aMZ1QqansEh9D4HQ6in0Wr8yh/Oe+GxtXtoce3ZQ2/G63qoFw5bu4S49uyhNyOE5jPOUwal5IoJ4emPrR9XKLu4dob6wnn0zgV0bbTX3WyFPh0AXXNU/0Koitjk+VHo11NySJAQahKqXoxdwEng1dcSgofiV+Ol/Sh+u4dSQNU9jgIKoWZKhNDzd7mUUGpC0vyLYFY/nFdLkBoQAUrj6jWGElqN19RX/Xe5LiBkrwJIALnrkT0lpGs/XaFEiNpTSVHqOO2vrucS4tqHULjmhFDxhTEphBROGU3jtH8IhYfbag+h+eo49VAiWE0w1T9aX11v+T1UBVANyAWITqWk4NX+Tu+h1YpYDVAITcl1c+5krwpiukJLo9u2jQJ0FUXrV8ej+qvuX95DVQdoPgGuAqSegsk/dVz1V16/+tGf6gDND6GE0Hk8Cl383zbbKZSO/eq4lr/6bLdEE4HuNevxQ5FKmAuoTuFQwhaf4qnFUDzLS24IvackhFLKmuNuhfhcyTXxss0JMKoIag8jgt1xFxC75LoOuPYhtPja4hLi2ofQEHqbQ3QocUsq2dsJ/vYnRdTjXIBI4SrAbkKo+z1+D3UdpkMOAXoBoPgfCdH+bgISfvahqDrDyeEQeo9QCI1Cax+NkSKpRNG4W2KpIpD/VILJXh0vV2h1AEQYjYdQMSVUQMXl8d+IqPurPT8KLX6/SITReBQqSogArVaEqpivzXdb1vQeGkLPCqEEC6Hir2JQghHg6pMrdX4IDaGnnGlfcsUjAX4HrB6yXMWp/ofQATGVALWEqwSp80NoCNUe/VEGu4cGdX3K+Ci0+I8f0imTACeCyZ56JNnT/tUJdfG3+gU3EaIGRA8uiACqAORP9f60HyUM2X++h4bQoQVGofc5H4UufjhPClVLGPVAainV41Ril/dQ1SGXIFVRtB/1YNrPHVfxm95DVYcIYFIcAUj+RKHmb2epAIdQ6PnVhyIiyB2nHqWuTwmirkcVhkq4vV8IPVwMb+3VEu46U95DXYfIPgpNyb1FICWXJJTxRxGwS+6j3mfzCwIhtFlShNAQ2gyBZuFEoSG0GQLNwolCQ2gzBJqFE4WG0GYINAsnCg2hzRBoFk4UGkKbIdAsnCi0GaF/Np1LDu4gOMUAAAAASUVORK5CYII=', 'Joana', 'Francisco', '2021-12-03', 'joanaf@gmail.com', 0, 'President', 'Western Mindanao State University (WMSU)', 'new', '2021-11-17 19:16:15'),
(87456452, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAACyElEQVR4nO2ZQW7kMAwE/f9PJ+ehgSiNJiWKUwXMyd5mk+VT9vmBUTynC0AuCB0GQoeB0GEgdBgIHQZCh4HQYSB0GAgdBkKHgdBhIHQYCB0GQodhC32eZ+tP7eO+322/5T52QLOFEeoGNFsYoW5As4UR6gYkF8rOdw/afb9XXrdC2fkIPVwoOx+hhwtl5yM0uVD1QdV89YCn91NBaPP9VBDafD8VhDbfT+XrhLr5u+erILT5fBWENp+vgtDm81W+Tujp+Wq+CkIRqhXqdtDT89V8FYQitLaQmu/O333w6nyEIrS2kJqP0JDXrZCaj9CQl12o+reaX/18936yDzsAoQhFKEIR+l8fdsJhuh30NNdvgNBPrt8AoZ9cvwFCP2n3x/ndB7+9/6uvHXD5QW7v/+prB1x+kNv7v/raAZcf5Pb+r752gHmQ3fPV5+772/OqCyF0c151IYRuzqsuhNDNeXaCOtA8oPuB7BacPW/Zx05QByLUmrfsYyeoAxFqzVv2sRPUgQi15i372AG7C4tCd8/P/iDkfnZAs4Oeno9Qc163+Qg153Wbf73Q5QDz4O7Bsvuo/bL7L/ukJ8YBCEXoX88RuuiTnhgHIHSW0GrUg+0WsFswQhHaC4SGeXbCYRAa5tkB5oGyF3YFZ+dlC1uBUISGAIRa72eDUISGgOLCrpDV+9kfVPZ+cl63Qmo+QkNet0JqPkJDXrdCaj5CQ151Ifdg2ULdf18t2AWhCA0BCG0FQhEaApoLzf4gun8ACEVoCEBo6vsuCEVoCGgmtJtghCbnu3nZ+1eDUPF5dZ4LQsXn1Xku1/9x/nSf7A/O7mcHIBShlfkIdQMQOlto9W81X+2n5rnzq0GomOfOrwahYp47vxqEinnu/Gr6/Q8tWCB0GAgdBkKHgdBhIHQYCB0GQoeB0GEgdBgIHQZCh4HQYSB0GAgdBkKH8QuQ2AE5gLlfYgAAAABJRU5ErkJggg==', 'Krizelle Mae', 'Falcasantos', '2021-12-01', 'ejoib78@gmail.com', 0, 'Member', 'Western Mindanao State University (WMSU)', 'new', '2021-11-18 02:15:31');


CREATE TABLE `payments` (
  `payment_id` int(55) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `chapter` varchar(255) NOT NULL,
  `payment_created` datetime DEFAULT current_timestamp(),
  `no_of_payers` int(255) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT 'current'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



CREATE TABLE `reports` (
  `report_id` int(20) NOT NULL,
  `event_id` int(30) NOT NULL,
  `chapter` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------


CREATE TABLE `transaction` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `chapter` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `member_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------


CREATE TABLE `users` (
  `member_id` int(8) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'rotaract',
  `role` varchar(255) NOT NULL DEFAULT 'member',
  `date_joined` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO `users` (`member_id`, `password`, `role`, `date_joined`) VALUES
(12345678, '$2b$10$8iktxE/MD8anfSGJk0.Eh.1ahEfhRWMgUggi4035QSnQdn2xx0z3.', 'admin', '2021-12-12 14:17:45'),
(23135789, '$2b$10$/lgXB9dMxIbH1MVmpi.WHOz8wof/mdP4/V08m7uoayEXOFbbsrewS', 'Member', '2021-12-07 19:58:56'),
(23947589, '$2b$10$/cAkBleQptxiOMTRZV.nn.3WXLeWCWFMSZaSci9h7UXGrjXa/mrfS', 'Member', '2021-12-12 12:43:34'),
(34256786, '$2b$10$s0lLy9xltsgJxrTN77rAT.kI5VbduhWW.u7qIQuTCYo.3qGO6Hm0S', 'Finance', '2021-12-04 19:09:46'),
(42374945, '$2b$10$bLM7GbxYvoW6Lbp3Q0KY9uOkCgLdhggAOo3DSlV0worAArZ9UJtge', 'Member', '2021-12-07 14:50:34'),
(43562456, '$2b$10$RAscD97V2SeeaJ2f0WaW6egc2Vv.ZEZi/8WAabjRvMkZeFBrP/iw2', 'Secretary', '2021-12-12 16:51:27'),
(56456789, '$2b$10$x9eVDe.7qvCZERXKInw8Eucz3O1cHjgGG4w7AqDv9KiwO/JQ3wZCu', 'President', '2021-11-18 03:16:15'),
(87456452, '$2b$10$RLwsxDWaIKD5VZpBfpwmJO3z3vL6.azSM367l2wfcdmnJWA5A4aLq', 'Member', '2021-11-18 10:15:31');


ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

-
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);


ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);


ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);


ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`member_id`);


ALTER TABLE `attendance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4665;


ALTER TABLE `donations`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;


ALTER TABLE `events`
  MODIFY `event_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4665;


ALTER TABLE `funds`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `payments`
  MODIFY `payment_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;


ALTER TABLE `transaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
