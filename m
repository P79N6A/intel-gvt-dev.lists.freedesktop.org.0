Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3687728ywa;
        Tue, 19 Feb 2019 12:22:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaTVbU4dxxrPccY5Mg4L2po9dHcApRhjtCwERjnAiKMznfxYrZ5U0s6jSBalo4g3PXXHdSN
X-Received: by 2002:a62:57d7:: with SMTP id i84mr31506463pfj.125.1550607737237;
        Tue, 19 Feb 2019 12:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550607737; cv=none;
        d=google.com; s=arc-20160816;
        b=hOtmY4SbtDAx0NKDmVK3SulE4MWYBstGYbogtoF6X0zXeEXLRyYgm6wqICMOabCXGr
         7SubOTEa9pYUJbv6/UPRrx/0N+E28Jtnv9Zq9CUTJ2/4ed8gA24otUzWednY6AtTWk+B
         Oux+Kf6OgoFqfbDLMcHm+GYI6sYFw8etF6cHraoDY3SXKSUo6oSOiWviS8IzwGhPOJRP
         1O/rUedNejGWwaVD9c/TW/ya5iSV3yw5XeiQXXD3SBgmF2a7D5eHcZukyB4rXsf50qrC
         wVC32LCd+NtXUOH4NGhnmChINE5RseFUOVRD0ulJAqAPLbH3NNk2wTPOuSeoW9SC887n
         NU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=BADqOcPvJ41HNFuJqbr+b7/tRD0HrmLKHzAbfm7GsyU=;
        b=TnXHHcgVzz1UTG9cULwdgtKjCfnxsXGSumgibvoogktBcDDLrELTwy16vylWXfNJNm
         W+jb13NZiKM1FjPLOLZDqES1mlBS2oJK+tChAmvcmjP0OEmDKdhc1agYlKAU++S3I//B
         laQ0wkNKGEBcqxe7OzUTOmG22fIhWw6rEgbdcYwf66kcuboZ52VHs14ewU5YnbxraO2W
         wYM1HyhfvQfw+jR6RULhYKJFCHy4OIEvX/4QBp95oFto9VWEX5jMHT8Hn2Y4exu4UCiZ
         7i+HRr2AvZyAkVA0wgK+HZ7ReZZBvSnYIkK4BPWlIOfmtmgQTzqZ6guDTGXUsPi+PUjo
         SHjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b20si5438648pls.193.2019.02.19.12.22.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 12:22:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EB288C90;
	Tue, 19 Feb 2019 20:22:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2478917E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 20:22:15 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 12:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; 
 d="log'?scan'208";a="135556471"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga002.jf.intel.com with ESMTP; 19 Feb 2019 12:22:09 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 12:22:08 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 12:22:08 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 20 Feb
 2019 04:22:06 +0800
Content-Type: multipart/mixed; boundary="===============6108882875462347191=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_7/8]_drm/i915/gvt:_vGPU_device_config_data_save/restore_interface
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190219072459.13873-1-yan.y.zhao@intel.com>
Message-ID: <4e00859b-23d3-4cb1-89b9-d9fe836971dd@shsmsx104.ccr.corp.intel.com>
Date: Wed, 20 Feb 2019 04:22:06 +0800
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

--===============6108882875462347191==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXzcvOF1fZHJtL2k5MTUvZ3Z0Ol92R1BVX2RldmljZV9j
b25maWdfZGF0YV9zYXZlL3Jlc3RvcmVfaW50ZXJmYWNlIDwvdGQ+CiAgICAgICAgICAgICAgICAg
ICAgICAgIDx0ZD55YW4ueS56aGFvIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5i
dWlsZF9mYWlsdXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBo
cmVmPSJodHRwOi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qt
a3ZtZ3QvMzczL2NvbnNvbGUiPjM3MzwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+
CiAgICAgICAgICAgICAgICA8L3RhYmxlPg==

--===============6108882875462347191==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM3MwpGYWlsZWQgdG8gYWRkIHRo
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
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpIRUFEIGlzIG5vdyBhdCBhZmE1ODllOWI0
YjUgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAybS0xOGQtMTdoLTIwbS0wOHMgQ1NUIGludGVncmF0aW9u
IG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy95YW4ueS56
aGFvLzE5X0ZlYl8yMDE5XzAyXzIzXzQxLmVtbAoKQXBwbHlpbmc6IGRybS9pOTE1L2d2dDogQXBw
bHkgZzJoIGFkanVzdCBmb3IgR1RUIG1taW8gYWNjZXNzCi9yb290L3BhdGNoZXMveWFuLnkuemhh
by8xOV9GZWJfMjAxOV8wMl8yM180MS5lbWwgc3VjY2VlZC4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy95
YW4ueS56aGFvLzE5X0ZlYl8yMDE5XzAyXzI0XzAxLmVtbAoKQXBwbHlpbmc6IGRybS9pOTE1L2d2
dDogQXBwbHkgZzJoIGFkanVzdG1lbnQgZHVyaW5nIGZlbmNlIG1taW8gYWNjZXNzCi9yb290L3Bh
dGNoZXMveWFuLnkuemhhby8xOV9GZWJfMjAxOV8wMl8yM180MS5lbWwgc3VjY2VlZC4KU3RhcnQK
L3Jvb3QvcGF0Y2hlcy95YW4ueS56aGFvLzE5X0ZlYl8yMDE5XzAyXzI0XzIwLmVtbAoKQXBwbHlp
bmc6IGRybS9pOTE1L2d2dDogUGF0Y2ggdGhlIGdtYSBpbiBncHUgY29tbWFuZHMgZHVyaW5nIGNv
bW1hbmQgcGFyc2VyCi9yb290L3BhdGNoZXMveWFuLnkuemhhby8xOV9GZWJfMjAxOV8wMl8yM180
MS5lbWwgc3VjY2VlZC4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy95YW4ueS56aGFvLzE5X0ZlYl8yMDE5
XzAyXzI0XzI5LmVtbAoKQXBwbHlpbmc6IGRybS9pOTE1L2d2dDogUmV0cmlldmUgdGhlIGd1ZXN0
IGdtIGJhc2UgYWRkcmVzcyBmcm9tIFBWSU5GTwovcm9vdC9wYXRjaGVzL3lhbi55LnpoYW8vMTlf
RmViXzIwMTlfMDJfMjNfNDEuZW1sIHN1Y2NlZWQuClN0YXJ0Ci9yb290L3BhdGNoZXMveWFuLnku
emhhby8xOV9GZWJfMjAxOV8wMl8yNF8zOS5lbWwKCkFwcGx5aW5nOiBkcm0vaTkxNS9ndnQ6IEFs
aWduIHRoZSBndWVzdCBnbSBhcGVydHVyZSBzdGFydCBvZmZzZXQgZm9yIGxpdmUgbWlncmF0aW9u
Ci9yb290L3BhdGNoZXMveWFuLnkuemhhby8xOV9GZWJfMjAxOV8wMl8yM180MS5lbWwgc3VjY2Vl
ZC4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy95YW4ueS56aGFvLzE5X0ZlYl8yMDE5XzAyXzI0XzUwLmVt
bAoKQXBwbHlpbmc6IGRybS9pOTE1L2d2dDogQXBwbHkgZzJoIGFkanVzdG1lbnQgdG8gYnVmZmVy
IHN0YXJ0IGdtYSBmb3IgZG1hYnVmCi9yb290L3BhdGNoZXMveWFuLnkuemhhby8xOV9GZWJfMjAx
OV8wMl8yM180MS5lbWwgc3VjY2VlZC4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy95YW4ueS56aGFvLzE5
X0ZlYl8yMDE5XzAyXzI0XzU5LmVtbApkcm0vaTkxNS9ndnQ6IEFwcGx5IGcyaCBhZGp1c3QgZm9y
IEdUVCBtbWlvIGFjY2Vzc188MjAxOTAyMTkwNzIzNDEuMTM1OTYtMS15YW4ueS56aGFvQGludGVs
LmNvbT4KZXJyb3I6IHBhdGNoIGZhaWxlZDogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5j
OjE4NQplcnJvcjogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5jOiBwYXRjaCBkb2VzIG5v
dCBhcHBseQplcnJvcjogcGF0Y2ggZmFpbGVkOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0
Lmg6NjA5CmVycm9yOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0Lmg6IHBhdGNoIGRvZXMg
bm90IGFwcGx5CkFwcGx5aW5nOiBkcm0vaTkxNS9ndnQ6IHZHUFUgZGV2aWNlIGNvbmZpZyBkYXRh
IHNhdmUvcmVzdG9yZSBpbnRlcmZhY2UKUGF0Y2ggZmFpbGVkIGF0IDAwMDEgZHJtL2k5MTUvZ3Z0
OiB2R1BVIGRldmljZSBjb25maWcgZGF0YSBzYXZlL3Jlc3RvcmUgaW50ZXJmYWNlClRoZSBjb3B5
IG9mIHRoZSBwYXRjaCB0aGF0IGZhaWxlZCBpcyBmb3VuZCBpbjogLmdpdC9yZWJhc2UtYXBwbHkv
cGF0Y2gKV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1biAiZ2l0IGFtIC0t
Y29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRvIHNraXAgdGhpcyBwYXRjaCwgcnVuICJnaXQgYW0g
LS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFuY2ggYW5kIHN0b3Ag
cGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLgovcm9vdC9wYXRjaGVzL3lhbi55LnpoYW8v
MTlfRmViXzIwMTlfMDJfMjNfNDEuZW1sIGZhaWxlZCEK

--===============6108882875462347191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============6108882875462347191==--
