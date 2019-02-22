Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1586348ywe;
        Fri, 22 Feb 2019 08:30:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYViGdbhNitYpyDVs4GAKcmHSmh9P0FYjnCOjYIycJNhX+X0QBkDb8dxzJpMQ+kP7rg8O8g
X-Received: by 2002:a17:902:3381:: with SMTP id b1mr5040329plc.13.1550853040765;
        Fri, 22 Feb 2019 08:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550853040; cv=none;
        d=google.com; s=arc-20160816;
        b=Gtfm++QaSe37HankoiH591yyHZ7JVzoaBys/gOgwknKFNc1j+eNK6/60rRda3nhWLI
         4HtcRbk0pJDRoBgwiTBOse7Z1BySirx0JusU4NoFAcVRPPbYVUnpItEx8B5izqh4dcJo
         2+XDkw3f/hxelLE8dX8bEofhfASeA65S2hchveT7vumPfRTmsbxjRRTOQH1jgi3Bxn5c
         eAzlkWAVMo5m5GyeEBG1LGSwaojcI23yBSGet0XsLzAla53F8xtjwNp1j6gp5EIsMWgx
         A3Iz9WiwBNoqQt2usirKP689JDNtbedySCaik0ME6c/RvYPsu57jVWXj4/5Ud83WRUqb
         JhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=X8I4mOcqQI8ZONz8NWdiH0dS7tQnCDmvJvdtB711B8c=;
        b=ZVExwTSjGbvpgITPhIBpTYWNvTBmNrwq0Q/qgpj6BWa+IapIqB/rju/f1+vQS69y1F
         mOmTc4sqE7oIhyhD77+QyzitrsuMtFOguhUevZkXTxEXviwwDtTVPnPL/6bsdSvQiC9j
         iBy3dy8nRb+evXR+lV03vBZABw5w1IQc4KtRBkkzicwhh7VTJUExBGjmp8TY1nMysxIQ
         yDk004cnhiEBOvYk1Tl8oli8ytmXTaU7mwjyByEQiTKDa6FTCNKQomxK1z1MEEZm7ThY
         RjSSu74SEaPpHJgCSODW09wE2Im8/BfevZXRifJOdeKUAh7rgMjdATVncyb/E2q9laKC
         zV7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id c24si1648562pgw.46.2019.02.22.08.30.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 08:30:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0189798;
	Fri, 22 Feb 2019 16:30:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80B89798
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 16:30:39 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 08:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,400,1544515200"; 
 d="log'?scan'208";a="120015554"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 22 Feb 2019 08:30:38 -0800
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 22 Feb 2019 08:30:37 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 22 Feb 2019 08:30:37 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Sat, 23 Feb
 2019 00:30:35 +0800
Content-Type: multipart/mixed; boundary="===============1492739638588296590=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v2]_drm/i915/gvt:_Add_in_context_mmio_0x20D8_to_gen9_mmio_list
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190222061342.21578-1-colin.xu@intel.com>
Message-ID: <6d9dc7ee-8f47-4fcf-8608-2a4449f99256@shsmsx104.ccr.corp.intel.com>
Date: Sat, 23 Feb 2019 00:30:35 +0800
X-Originating-IP: [10.239.48.224]
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1492739638588296590==
Content-Type: text/html; charset="uft-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

CiAgICAgICAgICAgICAgICA8dGFibGUgY29sb3I9IkNDQ0MzMyIgd2lkdGg9IjgwMCIgYm9yZGVy
PSIxIiBjZWxsc3BhY2luZz0iMCIgY2VsbHBhZGRpbmc9IjUiIHRleHQtYWxpZ249ImNlbnRlciI+
CiAgICAgICAgICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5
bGU9IndvcmQtd3JhcDpicmVhay13b3JkO3dvcmQtYnJlYWs6YnJlYWstYWxsOyIgd2lkdGg9IjEw
MHB4IiB0ZXh0LWFsaWduPSJjZW50ZXIiIGJnY29sb3I9ImxpZ2h0Ymx1ZSI+U3ViamVjdDo8L3Rk
PgogICAgICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249
ImNlbnRlciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Pd25lcjo8L3RkPgogICAgICAgICAgICAgICAg
ICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRlciIgYmdjb2xvcj0i
bGlnaHRibHVlIj48Zm9udCBjb2xvcj0ncmVkJz5FcnJvciBUeXBlOjwvZm9udD48L3RkPgogICAg
ICAgICAgICAgICAgICAgICAgICA8dGQgbm93cmFwPSJub3dyYXAiIHRleHQtYWxpZ249ImNlbnRl
ciIgYmdjb2xvcj0ibGlnaHRibHVlIj5Mb2c6PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3Ry
PgogICAgICAgICAgICAgICAgICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHRl
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3YyXV9kcm0vaTkxNS9ndnQ6X0FkZF9pbl9jb250ZXh0
X21taW9fMHgyMEQ4X3RvX2dlbjlfbW1pb19saXN0IDwvdGQ+CiAgICAgICAgICAgICAgICAgICAg
ICAgIDx0ZD5jb2xpbi54dSA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+YnVpbGRf
ZmFpbHVyZSA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+YnVpbGQgPGEgaHJlZj0i
aHR0cDovL2d2dC1qZW5raW5zLnNoLmludGVsLmNvbTo4MDgwL2pvYi9wYXRjaC10ZXN0LWt2bWd0
LzM3OC9jb25zb2xlIj4zNzg8L2E+PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAg
ICAgICAgICAgICAgPC90YWJsZT4=

--===============1492739638588296590==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM3OApGYWlsZWQgdG8gYWRkIHRo
ZSBFQ0RTQSBob3N0IGtleSBmb3IgSVAgYWRkcmVzcyAnMTAuMjM5LjQ4LjQzJyB0byB0aGUgbGlz
dCBvZiBrbm93biBob3N0cyAoL3Zhci9saWIvamVua2lucy8uc3NoL2tub3duX2hvc3RzKS4NCiAg
Q0xFQU4gICAuCiAgQ0xFQU4gICBhcmNoL3g4Ni9lbnRyeS92ZHNvCiAgQ0xFQU4gICBhcmNoL3g4
Ni9rZXJuZWwvY3B1CiAgQ0xFQU4gICBhcmNoL3g4Ni9rZXJuZWwKICBDTEVBTiAgIGFyY2gveDg2
L3B1cmdhdG9yeQogIENMRUFOICAgYXJjaC94ODYvcmVhbG1vZGUvcm0KICBDTEVBTiAgIGFyY2gv
eDg2L2xpYgogIENMRUFOICAgY2VydHMKICBDTEVBTiAgIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xp
YnN0dWIKICBDTEVBTiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24KICBDTEVBTiAgIGRyaXZlcnMv
bmV0L3dhbgogIENMRUFOICAgZHJpdmVycy9zY3NpL2FpYzd4eHgKICBDTEVBTiAgIGRyaXZlcnMv
c2NzaQogIENMRUFOICAgZHJpdmVycy90dHkvdnQKICBDTEVBTiAgIGtlcm5lbC9kZWJ1Zy9rZGIK
ICBDTEVBTiAgIGxpYi9yYWlkNgogIENMRUFOICAgbGliCiAgQ0xFQU4gICBuZXQvd2lyZWxlc3MK
ICBDTEVBTiAgIHNlY3VyaXR5L2FwcGFybW9yCiAgQ0xFQU4gICBzZWN1cml0eS9zZWxpbnV4CiAg
Q0xFQU4gICBzZWN1cml0eS90b21veW8KICBDTEVBTiAgIHVzcgogIENMRUFOICAgYXJjaC94ODYv
Ym9vdC9jb21wcmVzc2VkCiAgQ0xFQU4gICBhcmNoL3g4Ni9ib290CiAgQ0xFQU4gICBhcmNoL3g4
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9p
bnRlbC9ndnQtbGludXgKICsgZWI5N2JhYWViMDFjLi4uNjJlODc4Njc5MTljIGd2dC1zdGFnaW5n
ICAgICAtPiBvcmlnaW4vZ3Z0LXN0YWdpbmcgIChmb3JjZWQgdXBkYXRlKQogICAxM2JjYjgwYjdl
ZTcuLjFlOGIxNWExOTg4ZSAgZ3Z0LWZpeGVzICAgICAgIC0+IG9yaWdpbi9ndnQtZml4ZXMKICsg
NjFiZGRjZGFiM2JlLi4uNTE4MDdlMjk0YjdlIHRvcGljL2d2dC14ZW5ndCAtPiBvcmlnaW4vdG9w
aWMvZ3Z0LXhlbmd0ICAoZm9yY2VkIHVwZGF0ZSkKICogW25ldyB0YWddICAgICAgICAgICAgICAg
ICAgIGd2dC1zdGFnaW5nLTIwMTl5LTAybS0yMmQtMTZoLTIwbS00MnMgLT4gZ3Z0LXN0YWdpbmct
MjAxOXktMDJtLTIyZC0xNmgtMjBtLTQycwogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICAgICAg
Z3Z0LXhlbmd0LTIwMTl5LTAybS0yMmQtMTZoLTE0bS00OXMgLT4gZ3Z0LXhlbmd0LTIwMTl5LTAy
bS0yMmQtMTZoLTE0bS00OXMKICogW25ldyB0YWddICAgICAgICAgICAgICAgICAgIGd2dC14ZW5n
dC0yMDE5eS0wMm0tMjJkLTE0aC0wNm0tNTlzIC0+IGd2dC14ZW5ndC0yMDE5eS0wMm0tMjJkLTE0
aC0wNm0tNTlzCkhFQUQgaXMgbm93IGF0IDYyZTg3ODY3OTE5YyBndnQtc3RhZ2luZzogMjAxOXkt
MDJtLTIyZC0xNmgtMjBtLTQycyBDU1QgaW50ZWdyYXRpb24gbWFuaWZlc3QKQWxyZWFkeSB1cC10
by1kYXRlLgpTdGFydAovcm9vdC9wYXRjaGVzL2NvbGluLnh1LzIyX0ZlYl8yMDE5XzE0XzEzXzQy
LmVtbApkcm0vaTkxNS9ndnQ6IEFkZCBpbiBjb250ZXh0IG1taW8gMHgyMEQ4IHRvIGdlbjkgbW1p
byBsaXN0XzwyMDE5MDIyMjA2MTM0Mi4yMTU3OC0xLWNvbGluLnh1QGludGVsLmNvbT4KQXBwbHlp
bmc6IGRybS9pOTE1L2d2dDogQWRkIGluIGNvbnRleHQgbW1pbyAweDIwRDggdG8gZ2VuOSBtbWlv
IGxpc3QKUGF0Y2ggZmFpbGVkIGF0IDAwMDEgZHJtL2k5MTUvZ3Z0OiBBZGQgaW4gY29udGV4dCBt
bWlvIDB4MjBEOCB0byBnZW45IG1taW8gbGlzdApUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBm
YWlsZWQgaXMgZm91bmQgaW46IC5naXQvcmViYXNlLWFwcGx5L3BhdGNoCldoZW4geW91IGhhdmUg
cmVzb2x2ZWQgdGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHBy
ZWZlciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8g
cmVzdG9yZSB0aGUgb3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBh
bSAtLWFib3J0Ii4KZXJyb3I6IHBhdGNoIGZhaWxlZDogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21taW9fY29udGV4dC5jOjEzMgplcnJvcjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9f
Y29udGV4dC5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQovcm9vdC9wYXRjaGVzL2NvbGluLnh1LzIy
X0ZlYl8yMDE5XzE0XzEzXzQyLmVtbCBmYWlsZWQhCg==

--===============1492739638588296590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1492739638588296590==--
