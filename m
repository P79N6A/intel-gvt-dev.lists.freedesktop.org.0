Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1381130ywb;
        Thu, 28 Mar 2019 21:04:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/Gv++1FYvjVaCJOgacvIPETVzvZUUwgSDqIYHM+TJONI+WJEqeiS3jCuEbGs7kEW3+3Qr
X-Received: by 2002:aa7:8d01:: with SMTP id j1mr45928174pfe.122.1553832269621;
        Thu, 28 Mar 2019 21:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832269; cv=none;
        d=google.com; s=arc-20160816;
        b=u+EeVr9X84Q6DN7m7fjB9qfLE4i8UOUayFg3cIvT5gZN7PayoV5Js3Wa8aT0xgPfan
         wrNBgChUW3+Zl3jT1TPS1kvWDC+7QdYTH5MouwxMASgN5MD/yWenitOQrqzpDPMVRCYK
         5se+Km9GZ4bL/NOPeIKpxy/pDesbRRLZZdGxo/YysnyU/MH9SHQxi9fsjHEnZy1QtGfg
         xa5i1GF68lXY8nO2alytaFBnjSDRGLdd5zGnrebDwKp7AoGqCvE4Gy8UFMH5QGER9ATE
         YMIC/lKUFR/q1+JADIUT10aOfNkli3WnVexr+Mk6q6cduwucddpPNFQUwMNh090u1Kp9
         z8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=S7D7JA4YM3YMQMyYWy2vDcuU/4yPuqQM810feFxenNU=;
        b=MWOYFCBoQy0IMa/Mbaw+mYJHzGT6dueKVotQkOpzfvOgZ1Nw+8cgPLnQuE5xK13jhI
         dkk6DNuM85EwhOovTkOf9uScmKXP8MFTDINvIi1A01eHCoHVmIZJtnSsCM/PTAbtS0J2
         qaA16EtJIYhv/6ED3SzJ6T9zFDpUk6EEc2XxtQ56SL5kqs06aqJpTBJZlVeqhh69GIgn
         zYbXjqCwS3dkbEnjMX5Vc/enCN+ilOgD1UP6qi3mVk6BqGVbDrKZIw4m/5FivQOE14+8
         AnKtned1U+oNKGHPsIWY32Kl8sd5H58DKg09JVFkmTdDIFv4+A8A3jMId2SdpWrRwaSO
         TPyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 33si951234plq.275.2019.03.28.21.04.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:04:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AF96E81D;
	Fri, 29 Mar 2019 04:04:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0274A6E81D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2019 04:04:27 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; 
 d="log'?scan'208";a="126844026"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2019 21:04:27 -0700
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Mar 2019 21:04:27 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX126.amr.corp.intel.com (10.18.125.43) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Mar 2019 21:04:26 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 29 Mar
 2019 12:04:15 +0800
Content-Type: multipart/mixed; boundary="===============4599312185982465223=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v4_1/8]_drm/i915:_introduced_vgpu_pv_capability
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <1553866364-111114-2-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <074175c5-f7f9-4027-b7f8-54126590cbbf@shsmsx104.ccr.corp.intel.com>
Date: Fri, 29 Mar 2019 12:04:15 +0800
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

--===============4599312185982465223==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3Y0XzEvOF1fZHJtL2k5MTU6X2ludHJvZHVjZWRfdmdw
dV9wdl9jYXBhYmlsaXR5IDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD54aWFvbGlu
LnpoYW5nIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZF9mYWlsdXJlIDwv
dGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBocmVmPSJodHRwOi8vZ3Z0
LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qta3ZtZ3QvNDA4L2NvbnNv
bGUiPjQwODwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAg
ICA8L3RhYmxlPg==

--===============4599312185982465223==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDQwOApGYWlsZWQgdG8gYWRkIHRo
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
bnRlbC9ndnQtbGludXgKICsgYmM3YTAxZDJlYmQ1Li4uNjM2NDBlMTc2ZmVlIGd2dC1zdGFnaW5n
IC0+IG9yaWdpbi9ndnQtc3RhZ2luZyAgKGZvcmNlZCB1cGRhdGUpCiAgIDcyYWFiZmI4NjJlNC4u
YTE0ZjA2ODU0NWNjICBndnQtZml4ZXMgICAtPiBvcmlnaW4vZ3Z0LWZpeGVzCiAgIDljMWM4NDE2
ZmMzNy4uZDU3YjM5ZTNlZTNjICBndnQtbmV4dCAgICAtPiBvcmlnaW4vZ3Z0LW5leHQKICogW25l
dyB0YWddICAgICAgICAgICAgICAgICAgIGd2dC1zdGFnaW5nLTIwMTl5LTAzbS0yOWQtMTFoLTEx
bS0wNXMgLT4gZ3Z0LXN0YWdpbmctMjAxOXktMDNtLTI5ZC0xMWgtMTFtLTA1cwpIRUFEIGlzIG5v
dyBhdCA2MzY0MGUxNzZmZWUgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAzbS0yOWQtMTFoLTExbS0wNXMg
Q1NUIGludGVncmF0aW9uIG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KPT09PT09U3RhcnQg
dG8gYXBwbHkgcGF0Y2ggZm9yIGtlcm5lbCBidWlsZD09PT09PQo9PVBhdGNoIHBhdGg6IC9yb290
L3BhdGNoZXMveGlhb2xpbi56aGFuZy8yOV9NYXJfMjAxOV8wOV8zMl8zNy5lbWwKPT1ERVM6IGRy
bS9pOTE1OiBpbnRyb2R1Y2VkIHZncHUgcHYgY2FwYWJpbGl0eV88MTU1Mzg2NjM2NC0xMTExMTQt
Mi1naXQtc2VuZC1lbWFpbC14aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPT1CZWdpbiB0byBhcHBs
eSB0aGUgcGF0Y2ggd2l0aCBnaXQgYW09PQpBcHBseWluZzogZHJtL2k5MTU6IGludHJvZHVjZWQg
dmdwdSBwdiBjYXBhYmlsaXR5ClBhdGNoIGZhaWxlZCBhdCAwMDAxIGRybS9pOTE1OiBpbnRyb2R1
Y2VkIHZncHUgcHYgY2FwYWJpbGl0eQpUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBmYWlsZWQg
aXMgZm91bmQgaW46IC5naXQvcmViYXNlLWFwcGx5L3BhdGNoCldoZW4geW91IGhhdmUgcmVzb2x2
ZWQgdGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHByZWZlciB0
byBza2lwIHRoaXMgcGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8gcmVzdG9y
ZSB0aGUgb3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAtLWFi
b3J0Ii4KZXJyb3I6IHBhdGNoIGZhaWxlZDogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1
LmM6NzkKZXJyb3I6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jOiBwYXRjaCBkb2Vz
IG5vdCBhcHBseQo9PUFwcGx5IC9yb290L3BhdGNoZXMveGlhb2xpbi56aGFuZy8yOV9NYXJfMjAx
OV8wOV8zMl8zNy5lbWwgLSBmYWlsdXJlISEhISA9PQo9PUJ1aWxkIC1mYWlsdXJlPT0K

--===============4599312185982465223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============4599312185982465223==--
