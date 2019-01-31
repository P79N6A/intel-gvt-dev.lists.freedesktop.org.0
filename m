Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp503670ywd;
        Wed, 30 Jan 2019 20:14:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYeCpwVgsvBTzNw2p/VZExZQA8kfBBiYvzM27slsUdzwJOKS7KOemmiy2a9KFIpqNzynMFH
X-Received: by 2002:a17:902:70cc:: with SMTP id l12mr19305511plt.149.1548908087774;
        Wed, 30 Jan 2019 20:14:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548908087; cv=none;
        d=google.com; s=arc-20160816;
        b=AIEl/reTTwhjTPMKh1/wBaCh880hiZvn/B8FitO+PL+PpLoNBmObe3k+Cv8CsGTJwN
         g4W9TlSG96igAq1VwIpJiEKRFZ2OVJFkO8XsvLuIczEg+mXCNTJoz4eEwilj/fBGMgME
         CCTCYIGuo8j1LQxJXrancO6EZAte5bMk5Gc/z5T3bCVoRVk3M9dwBzs33v4SoTt+jrqf
         K7U8wpnCV8xZMQPzQG0A0K6hUm0fSb0M4Pzi7FZFJ7q/2CzZ0yckHPOYfIDy1ktCZsPO
         s814Xmawh39r/ASDZpJwfJk6sMAdDlNVVnfKYJshkybpLcc8gTmYhv/7uLzBd3cGNoxX
         PhNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=/uAjZPuMABsVkosnEsFeHvIGQtCLNTnAsuP0kfF3Uac=;
        b=ZozYeYyII/fuVeWgtNMREwAYMvwOSVaJI9Syo26nDddStbuXDXBoosizEbjenaBFMj
         J2Bn+12aJ6Og1rvsYzozzfHM1r0/ohI+QGlcsI2QdgN3o0+5VuFiqWrLRX9efjxvnaGJ
         LklzYfN6vWmjfCkKOgkL87LmGtDz94+sV/lThb0II6eI7zE59dbt3jAozLNzQ0WnI5xz
         5pvozQdW04B2PGLye++h2BwKm5HDsMYlQbXGt8oBLwdBX+/spa90XI3km/TV5oNt5SNh
         UN4tjXfLeEJmFSf/TQi9n62iivgKvXbJJ2fYZ9Om82LGsNYolTGCnFgOwyr+bDP4M4jz
         jklw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k22si3472093pll.276.2019.01.30.20.14.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 20:14:47 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCD06E169;
	Thu, 31 Jan 2019 04:14:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318C6E0EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 31 Jan 2019 04:14:44 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2019 20:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,543,1539673200"; 
 d="log'?scan'208";a="111225537"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2019 20:14:44 -0800
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 30 Jan 2019 20:14:43 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 30 Jan 2019 20:14:43 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 31 Jan
 2019 12:14:41 +0800
Content-Type: multipart/mixed; boundary="===============1816803432407889012=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH]_drm:_prefix_header_search_paths_with_/
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <1548906999-22143-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <31a8d706-2869-48ee-887d-fa54710803d7@shsmsx104.ccr.corp.intel.com>
Date: Thu, 31 Jan 2019 12:14:41 +0800
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

--===============1816803432407889012==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXV9kcm06X3ByZWZpeF9oZWFkZXJfc2VhcmNoX3BhdGhz
X3dpdGhfLyA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+eWFtYWRhLm1hc2FoaXJv
IDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZF9mYWlsdXJlIDwvdGQ+CiAg
ICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBocmVmPSJodHRwOi8vZ3Z0LWplbmtp
bnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qta3ZtZ3QvMzYwL2NvbnNvbGUiPjM2
MDwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAgICA8L3Rh
YmxlPg==

--===============1816803432407889012==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM2MApGYWlsZWQgdG8gYWRkIHRo
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
bnRlbC9ndnQtbGludXgKICsgNTBjM2Y3OWEyNWJlLi4uNmFlNmYyMjRkOGEzIGd2dC1zdGFnaW5n
IC0+IG9yaWdpbi9ndnQtc3RhZ2luZyAgKGZvcmNlZCB1cGRhdGUpCiAgIDJlNjc5ZDQ4ZjM4Yy4u
MzljNjhlODdiYzUwICBndnQtbmV4dCAgICAtPiBvcmlnaW4vZ3Z0LW5leHQKICogW25ldyB0YWdd
ICAgICAgICAgICAgICAgICAgIGd2dC1zdGFnaW5nLTIwMTl5LTAxbS0zMWQtMTFoLTI4bS01NnMg
LT4gZ3Z0LXN0YWdpbmctMjAxOXktMDFtLTMxZC0xMWgtMjhtLTU2cwpIRUFEIGlzIG5vdyBhdCA2
YWU2ZjIyNGQ4YTMgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAxbS0zMWQtMTFoLTI4bS01NnMgQ1NUIGlu
dGVncmF0aW9uIG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hl
cy95YW1hZGEubWFzYWhpcm8vMzFfSmFuXzIwMTlfMTJfNTZfMzkuZW1sCmRybTogcHJlZml4IGhl
YWRlciBzZWFyY2ggcGF0aHMgd2l0aCAkKHNyY3RyZWUpL188MTU0ODkwNjk5OS0yMjE0My0xLWdp
dC1zZW5kLWVtYWlsLXlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgplcnJvcjogcGF0Y2gg
ZmFpbGVkOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvTWFrZWZpbGU6NQplcnJvcjogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlOiBwYXRjaCBkb2VzIG5vdCBhcHBseQpBcHBseWlu
ZzogZHJtOiBwcmVmaXggaGVhZGVyIHNlYXJjaCBwYXRocyB3aXRoICQoc3JjdHJlZSkvClBhdGNo
IGZhaWxlZCBhdCAwMDAxIGRybTogcHJlZml4IGhlYWRlciBzZWFyY2ggcGF0aHMgd2l0aCAkKHNy
Y3RyZWUpLwpUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBmYWlsZWQgaXMgZm91bmQgaW46IC5n
aXQvcmViYXNlLWFwcGx5L3BhdGNoCldoZW4geW91IGhhdmUgcmVzb2x2ZWQgdGhpcyBwcm9ibGVt
LCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0
Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwg
YnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFib3J0Ii4KL3Jvb3QvcGF0
Y2hlcy95YW1hZGEubWFzYWhpcm8vMzFfSmFuXzIwMTlfMTJfNTZfMzkuZW1sIGZhaWxlZCEK

--===============1816803432407889012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1816803432407889012==--
