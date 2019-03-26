Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp4462197ywb;
        Mon, 25 Mar 2019 23:44:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws72rklmfFCOhVX2HjOAL9rXW6/cJxuHOebP0GOb1t6GM/zbduhAUm7mrnfDPWEksyMZ2X
X-Received: by 2002:a63:570d:: with SMTP id l13mr19713544pgb.55.1553582684413;
        Mon, 25 Mar 2019 23:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553582684; cv=none;
        d=google.com; s=arc-20160816;
        b=aIguyFHIVaubfHwY3/cJ5kTfPcG4hUwhFwp8x3TJ7lfJmPUADHuKbH9tWjvc6ycMJ6
         r/N3Kt9L6e0Ag3lS7px5zusoy3A/LCMUeaU0JMzXn1jzMocB7QLieLQRFOdn43fHDgH8
         tjrEtnkuj4m42+VGwdQlcRBlJoQDnVDZJnmsGTyLV0TbSP2M3RGV/7w3H3S6HGkMow9L
         4ETxu/U/nOmLLTkqBRt/mDll6MJ6PFdiwuyycPmscmCkknaIK64jBqAQXBuC3D8lqhT0
         CaGPtjhWonPN/xxwhiznLunE17uH5P+xbXnj3sDdVul0z4p3iQOBGCqTrkPcE2Kg0H76
         Y8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=1G1323rOODWqz/AFm5Pw08IC28p4/j1gh/OLmkVaYb8=;
        b=GPmgK/GGm7QXev22IBPO2wWY9JIqJFJRvLBgjY6bFmjSjJEHlHNvY8xVdbVQ9q3FdF
         syefMg4dRQ+DLR2qsi4s5jso0QRS/2nh1xLBzm3E/9Nst1HcWyjzHYqILOPG0YJqo1ZU
         z7gPqeMCplTbYzOYZx2ElrRjX7XQmATSCQZ5iepgTkGLMeQDy2I0poyaecafyzQhPoIT
         pDLJjgs31JGD5+XOB2l/LD+obv2w/BSMdxymAuaBB5RJATL1Wsc9SRBUy0fOSfrRLyZW
         00nfkqHH8BdqRzSM0//YUihsgttWVveU10WOqQ/z4wOcJram1fi4I9xq9HVdYsu+govE
         jIdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d11si4006393pfm.30.2019.03.25.23.44.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 23:44:44 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E306E78C;
	Tue, 26 Mar 2019 06:44:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEEA6E78C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Mar 2019 06:44:43 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 23:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; 
 d="log'?scan'208";a="134773607"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2019 23:44:41 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 25 Mar 2019 23:44:41 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 25 Mar 2019 23:44:40 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 26 Mar
 2019 14:44:39 +0800
Content-Type: multipart/mixed; boundary="===============5480914502150006917=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch [PATCH_v3]_drm/i915/gvt:_Change_fb_info-
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <1553582728-3354-1-git-send-email-xiong.y.zhang@intel.com>
Message-ID: <1b4f8ef0-c0b3-4d50-b1ed-7e30dc051d0b@shsmsx104.ccr.corp.intel.com>
Date: Tue, 26 Mar 2019 14:44:39 +0800
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

--===============5480914502150006917==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3YzXV9kcm0vaTkxNS9ndnQ6X0NoYW5nZV9mYl9pbmZv
LSA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+eGlvbmcueS56aGFuZyA8L3RkPgog
ICAgICAgICAgICAgICAgICAgICAgICA8dGQ+YnVpbGRfZmFpbHVyZSA8L3RkPgogICAgICAgICAg
ICAgICAgICAgICAgICA8dGQ+YnVpbGQgPGEgaHJlZj0iaHR0cDovL2d2dC1qZW5raW5zLnNoLmlu
dGVsLmNvbTo4MDgwL2pvYi9wYXRjaC10ZXN0LWt2bWd0LzQwNC9jb25zb2xlIj40MDQ8L2E+PC90
ZD4KICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgPC90YWJsZT4=

--===============5480914502150006917==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDQwNApGYWlsZWQgdG8gYWRkIHRo
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
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpIRUFEIGlzIG5vdyBhdCBiYzdhMDFkMmVi
ZDUgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAzbS0yNWQtMTFoLTAybS01M3MgQ1NUIGludGVncmF0aW9u
IG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy94aW9uZy55
LnpoYW5nLzI2X01hcl8yMDE5XzE0XzQ1XzI4LmVtbApkcm0vaTkxNS9ndnQ6IENoYW5nZSBmYl9p
bmZvLT5zaXplIGZyb20gcGFnZXMgdG8gYnl0ZXNfPDE1NTM1ODI3MjgtMzM1NC0xLWdpdC1zZW5k
LWVtYWlsLXhpb25nLnkuemhhbmdAaW50ZWwuY29tPgpBcHBseWluZzogZHJtL2k5MTUvZ3Z0OiBD
aGFuZ2UgZmJfaW5mby0+c2l6ZSBmcm9tIHBhZ2VzIHRvIGJ5dGVzClBhdGNoIGZhaWxlZCBhdCAw
MDAxIGRybS9pOTE1L2d2dDogQ2hhbmdlIGZiX2luZm8tPnNpemUgZnJvbSBwYWdlcyB0byBieXRl
cwpUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBmYWlsZWQgaXMgZm91bmQgaW46IC5naXQvcmVi
YXNlLWFwcGx5L3BhdGNoCldoZW4geW91IGhhdmUgcmVzb2x2ZWQgdGhpcyBwcm9ibGVtLCBydW4g
ImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1
biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgYnJhbmNo
IGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFib3J0Ii4KZXJyb3I6IHBhdGNoIGZh
aWxlZDogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jOjI2NAplcnJvcjogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQovcm9vdC9w
YXRjaGVzL3hpb25nLnkuemhhbmcvMjZfTWFyXzIwMTlfMTRfNDVfMjguZW1sIGZhaWxlZCEK

--===============5480914502150006917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============5480914502150006917==--
