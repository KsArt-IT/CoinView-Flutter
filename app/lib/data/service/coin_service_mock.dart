import 'package:coin_view/data/models/coin_dto.dart';
import 'package:coin_view/data/models/models_dto.dart';

interface class CoinServiceMock {
  static final listCoins = [
    CoinDTO(
      id: "1",
      name: "Bitcoin",
      symbol: "BTC",
      rank: 1,
      isNew: true,
      isActive: true,
      type: "coin",
    ),
    CoinDTO(
      id: "2",
      name: "Ethereum",
      symbol: "ETH",
      rank: 2,
      isNew: true,
      isActive: true,
      type: "coin",
    ),
    CoinDTO(
      id: "3",
      name: "Tether",
      symbol: "USDT",
      rank: 3,
      isNew: true,
      isActive: true,
      type: "coin",
    ),
  ];
  
  static final listCoinsDetail = [
    CoinDetailDto(
      id: "1",
      name: "Bitcoin",
      symbol: "BTC",
      rank: 1,
      isNew: true,
      isActive: true,
      type: "coin",
      contract: "BTC",
      logo:
          "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1747033579",
      platform: "bitcoin",
      description:
          "Bitcoin is a digital currency that is a decentralized, peer-to-peer payment system.",
      developmentStatus: "active",
      firstDataAt: "2009-01-03T00:00:00Z",
      hardwareWallet: true,
      hashAlgorithm: "SHA-256",
      lastDataAt: "2009-01-03T00:00:00Z",
      message:
          "Bitcoin is a digital currency that is a decentralized, peer-to-peer payment system.",
      openSource: true,
      orgStructure: "organization",
      proofType: "proof",
      startedAt: "2009-01-03T00:00:00Z",
      tags: [],
      team: [],
      whitepaper: CoinWhitepaperDto(
        link: "https://bitcoin.org/bitcoin.pdf",
        thumbnail:
            "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1747033579",
      ),
    ),
    CoinDetailDto(
      id: "2",
      name: "Ethereum",
      symbol: "ETH",
      rank: 1,
      isNew: true,
      isActive: true,
      type: "coin",
      contract: "ETH",
      logo:
          "https://assets.coingecko.com/coins/images/2/large/ethereum.png?1747033579",
      platform: "ethereum",
      description:
          "Ethereum is a blockchain-based platform that allows developers to build and deploy decentralized applications.",
      developmentStatus: "active",
      firstDataAt: "2015-07-30T00:00:00Z",
      hardwareWallet: true,
      hashAlgorithm: "SHA-256",
      lastDataAt: "2015-07-30T00:00:00Z",
      message:
          "Ethereum is a blockchain-based platform that allows developers to build and deploy decentralized applications.",
      openSource: true,
      orgStructure: "organization",
      proofType: "proof",
      startedAt: "2015-07-30T00:00:00Z",
      tags: [],
      team: [],
      whitepaper: CoinWhitepaperDto(
        link: "https://ethereum.org/whitepaper",
        thumbnail:
            "https://assets.coingecko.com/coins/images/2/large/ethereum.png?1747033579",
      ),
    ),
    CoinDetailDto(
      id: "3",
      name: "Tether",
      symbol: "USDT",
      rank: 1,
      isNew: true,
      isActive: true,
      type: "coin",
      contract: "USDT",
      logo:
          "https://assets.coingecko.com/coins/images/3/large/tether.png?1747033579",
      platform: "tether",
      description:
          "Tether is a stablecoin that is a decentralized, peer-to-peer payment system.",
      developmentStatus: "active",
      firstDataAt: "2014-11-25T00:00:00Z",
      hardwareWallet: true,
      hashAlgorithm: "SHA-256",
      lastDataAt: "2014-11-25T00:00:00Z",
      message:
          "Tether is a stablecoin that is a decentralized, peer-to-peer payment system.",
      openSource: true,
      orgStructure: "organization",
      proofType: "proof",
      startedAt: "2014-11-25T00:00:00Z",
      tags: [],
      team: [],
      whitepaper: CoinWhitepaperDto(
        link: "https://tether.to/whitepaper",
        thumbnail:
            "https://assets.coingecko.com/coins/images/3/large/tether.png?1747033579",
      ),
    ),
  ];
}
