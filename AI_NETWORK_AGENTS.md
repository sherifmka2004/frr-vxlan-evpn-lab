# AI Network Troubleshooting Agents

Open-source projects for AI-powered network troubleshooting and automation, sorted by maturity and potential for integration with network labs.

## GitHub Projects (Ranked by Promise)

| # | Project | Stars | Language | Stack | Last Updated | Description |
|---|---------|-------|----------|-------|-------------|-------------|
| 1 | [NetClaw](https://github.com/automateyournetwork/netclaw) | ~160 | Python | OpenClaw, pyATS, MCP | 2026-03-05 | CCIE-level autonomous AI agent. 82 skills, 37 MCP servers. Live SSH to IOS-XE, NX-OS, JunOS, ASA. OSPF/BGP troubleshooting, ServiceNow/NetBox integration, Cisco CML/NSO/SD-WAN support |
| 2 | [AI-Network-Troubleshooting-PoC](https://github.com/jillesca/AI-Network-Troubleshooting-PoC) | 33 | Python | OpenAI, LangChain, pyATS, Grafana | 2026-01-22 | Grafana alert → LLM → pyATS remediation pipeline. Demonstrates ISIS routing failure detection, command execution, and telemetry-driven diagnosis |
| 3 | [oncall-netops-tig-pyats-demo](https://github.com/jillesca/oncall-netops-tig-pyats-demo) | - | Python | TIG (Telegraf/InfluxDB/Grafana), pyATS, LLM | 2026-03-03 | On-call NetOps demo with TICK stack, pyATS for network testing, and LLM integration for automated troubleshooting |
| 4 | [ReACT_AI_Agent_for_Cisco_IOS_XE](https://github.com/automateyournetwork/ReACT_AI_Agent_for_Cisco_IOS_XE) | 27 | Python | ReACT, pyATS, Cisco IOS XE | 2026-02-16 | Cisco DevNet demo wiring alerts into ReACT-style agents that call pyATS/Netmiko to run CLI checks and fixes per intent. Includes Webex/Grafana integrations |
| 5 | [Multi_Device_AI_Agent](https://github.com/automateyournetwork/multi_device_ai_agent) | 35 | Python | Cisco CML, Streamlit | 2025-12-19 | Extends AI agents to full simulated topology, executing multi-device CLI work via pyATS and providing a Streamlit control plane |
| 6 | [netbox_react_agent](https://github.com/automateyournetwork/netbox_react_agent) | 12 | Python | ReACT, NetBox, pyATS | 2026-02-15 | Intent-driven NetBox troubleshooting that formulates CLI commands, queries inventory, and writes compliance fixes back to NetBox |
| 7 | [bubbln_network-automation](https://github.com/olasupo/bubbln_network-automation) | 4 | Python | LangChain, Netmiko, Monitoring | 2026-02-18 | LLM + automation scripts for live Cisco networking labs; showcases reasoning chains that convert alerts into CLI sequences |
| 8 | [unlocking-ai-agents-network-engineering](https://github.com/flopach/unlocking-ai-agents-network-engineering) | 4 | Python/Jupyter | smolagents, Netmiko, Catalyst 8000V | 2025-05-11 | Cisco learning lab with local LLMs (Llama 3.1, Qwen 2.5) issuing CLI calls. Emphasizes transparency, local telemetry ingestion, and tool validation |
| 9 | [ai-agent-automation](https://github.com/lahcenkh/ai-agent-automation) | 6 | Python | Netmiko, LangChain, DeepSeek | 2025-02-11 | LangChain orchestrates DeepSeek LLM to authenticate, run Netmiko SSH, and apply RFCs on IOS XR infrastructure |
| 11 | [AI-TAC](https://github.com/metajar/ai-tac) | 3 | Go | GPT, CLI/TUI | 2026-02-13 | Lightweight GPT-powered troubleshooting assistant with a CLI/TUI that can execute SSH commands for diagnostics |
| 12 | [pyATS_AI_Agent](https://github.com/vibeopsforum/pyATS_AI_Agent) | - | Python | Cisco pyATS, LLM | 2026-01-13 | Dynamically scripts and runs Cisco pyATS tests from natural language prompts |
| 13 | [netmiko-ai](https://github.com/mesutozsoytraining/netmiko-ai) | 1 | Python | Netmiko, Claude 3.5 | 2025-02-08 | Netmiko + Claude 3.5 Sonnet for network engineering CLI automation, useful as an Anthropic-driven proof-of-concept |
| 14 | [gpt-neteng](https://github.com/jonhammer/gpt-neteng) | - | Python | GPT | 2026-01-27 | "The AI Network Engineer" early/minimal CLI-focused implementation |

## Architecture Patterns

| Pattern | How It Works | Best For |
|---------|-------------|----------|
| **MCP Servers** (NetClaw) | LLM connects to network devices via standardized Model Context Protocol servers | Production-grade, multi-vendor, extensible |
| **LangChain / ReACT + Tool Calling** (PoC, ai-agent-automation, ReACT_AI_Agent_for_Cisco_IOS_XE, netbox_react_agent) | LLM (LangChain or ReACT) decides which CLI commands to run, tools execute via SSH (Netmiko/pyATS), and events from NetBox/streamlit/UIs feed intent | Rapid prototyping, telemetry + NetBox-aware remediation |
| **Webhook-triggered** (PoC) | Monitoring alerts (Grafana) trigger LLM to diagnose and remediate | Event-driven, closed-loop automation |
| **smolagents + Local LLM** (Cisco lab) | Lightweight agent framework with local models, no cloud dependency | Air-gapped labs, learning environments |

## Key Technologies

- **SSH Libraries**: [Netmiko](https://github.com/ktbyers/netmiko) / [Paramiko](https://github.com/paramiko/paramiko) / [NAPALM](https://github.com/napalm-automation/napalm) - device connectivity
- **Cisco pyATS**: Test automation framework with device abstraction ([pyATS docs](https://developer.cisco.com/docs/pyats/))
- **MCP (Model Context Protocol)**: Anthropic's standard for LLM-to-tool integration ([spec](https://modelcontextprotocol.io/))
- **OpenClaw**: Open-source AI assistant framework (NetClaw's foundation)
- **LangChain**: LLM orchestration with tool/function calling
- **smolagents**: Hugging Face lightweight agent framework
- **Cisco CML**: Network lab simulation

## Commercial Solutions

- **[Kentik AI Advisor](https://www.kentik.com/)** - Agentic analysis for NMS (read-only, observability-focused)
- **[Cisco AI Agent](https://blogs.cisco.com/developer/ai-agents-for-network-and-security-expectations-vs-reality)** - Enterprise deep network troubleshooting
- **[Selector AI](https://www.selector.ai/)** - Copilot for Network Automation (RAG over telemetry + LLM)
- **[Nanites AI](https://nanites.ai/)** - AI Network Engineers product
- **[Aviz Networks](https://aviznetworks.com/)** - AI-optimized, vendor-agnostic networking

## Relevant Cisco Blog Posts

- [Agentic AI: A New Frontier for Network Engineers](https://blogs.cisco.com/learning/a-new-frontier-for-network-engineers-agentic-ai-that-understands-your-network) - MCP for network topology understanding
- [AI Agents for Network and Security: Expectations vs Reality](https://blogs.cisco.com/developer/ai-agents-for-network-and-security-expectations-vs-reality)
- [How To Get Started Using LLMs in IT and Network Engineering](https://blogs.cisco.com/developer/how-to-get-started-using-llms-in-it-and-network-engineering)
- [Making Agentic AI Observable: Deep Network Troubleshooting](https://blogs.cisco.com/sp/making-agentic-ai-observable-how-deep-network-troubleshooting-builds-trust-through-transparency) - explains how telemetry, CLI-call audits, and explainable reasoning enable trusted automation

## LinkedIn Signals

- MohammadReza Darjazini (Cisco) shows how AI troubleshooting agents evolve from data helpers to CLI-running investigators, referencing Ansible/pyATS execution and traceable reasoning for alerts-to-remediation ((https://www.linkedin.com/posts/mohammadreza-darjazini-871baa5a_networktroubleshooting-ai-automation-activity-7429260686590914561-SJzr?utm_source=openai)).
- Sergio Bea (Cisco) uses the “Deep Network Troubleshooting” architecture to stress transparent CLI command execution, trusted tool calls, and local knowledge when delivering LL M-led remediation ((https://www.linkedin.com/posts/sergiobea_building-ai-you-can-trust-for-network-troubleshooting-activity-7405242358356684800-T3b3?utm_source=openai)).

## Potential Integration with This Lab

These projects can be integrated with FRR VXLAN/EVPN labs for:
- Automated verification of BGP EVPN/VXLAN configurations
- OSPF/BGP troubleshooting with natural language queries
- Health checks and diagnostics via SSH to FRR containers
- Configuration compliance checking
- Event-driven remediation (Grafana alerts -> LLM -> CLI fix)
