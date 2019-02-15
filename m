Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp378451ywa;
        Fri, 15 Feb 2019 00:57:52 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYSAHiZ7r1qpRj3KdDIEKoX6Ujpt+7M5OxOSNGEDjhEH4a1kgmpPQ1w8C47BYxuzrVu2igE
X-Received: by 2002:a62:6e05:: with SMTP id j5mr8969408pfc.158.1550221072218;
        Fri, 15 Feb 2019 00:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550221072; cv=none;
        d=google.com; s=arc-20160816;
        b=mGsd7lmCmQ07/ya7gaJyA5CxFwGsyFHt6iddsNTMMvi/uyOjkWs/ku3WrAQK3MnmRc
         I+9V/tTQC+pcNQXfOOXmdU4VBWgLiN9PRXUu9y8gw/OFWzAJT7Q99OmxQQ0dypTAJk3k
         F5sxfsDw9HWuuhwcbIaeKzyash2OMY9T52kYetQo6GGbTI2DsvgI7hhtc9hYtCU2tsfN
         Fhi4iqxMwxmF39ruKHSOFTAJ9AafJdTlwT4er2AyENNcouD10mC7iQl6AZY9yprPRQi/
         3C/Nt347s5SvxWObsAuTPWwUBTqvjRRxE84WUDGs5prbneFa7QjpFLaPjxVNwgm4APgx
         dX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=K4DolqRaOJRDjd9pCRpmMV/GZlNUekcA1898KN1l6GU=;
        b=TVdnZwxsISBsA+RwmzfCYnEniVpyQ0zaHdCshGFhAs7Sx1bHfE4ItDw+3GytPEXMdp
         FRuY+pgjWmgF0RS6wC2rF3E0/F1i7cH6L3NEHKfPUieHphZ7mCPNRaDFYDHiVJEjuNge
         Odu3WhdQ94WxjDLWd9B7c0l9pGqPLp80OnjE1HiHc6Mqg3ydciHMvOiLBaq7y7gsuK24
         2td8TQ7W3DbwGBqS8ynzq+yalxN68e7BW7Q08IxGuzPVNSYndrKApMqXgfiZjyFMSUic
         3tpMEueJG9/s0pczd9ayn/n3RajSRD7sKr3o1tq8RTlEXxohahDU7xRi6CTjJGMy8YEA
         pS3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j10si2694513plk.238.2019.02.15.00.57.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Feb 2019 00:57:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF95F6EAC9;
	Fri, 15 Feb 2019 08:57:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ACD6EB31
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 15 Feb 2019 08:54:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Feb 2019 00:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,372,1544515200"; 
 d="log'?scan'208";a="299966372"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 15 Feb 2019 00:53:45 -0800
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 15 Feb 2019 00:53:44 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 15 Feb 2019 00:53:44 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 15 Feb
 2019 16:53:41 +0800
Content-Type: multipart/mixed; boundary="===============3902114786415279117=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_1/2]_hv:_pass-thru_PMU_registers_when_no_PROFILING_ON
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190215014204.6650-1-min.he@intel.com>
Message-ID: <c0905d2e-30a2-458d-96f3-1da9085f91ba@shsmsx104.ccr.corp.intel.com>
Date: Fri, 15 Feb 2019 16:53:41 +0800
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

--===============3902114786415279117==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXzEvMl1faHY6X3Bhc3MtdGhydV9QTVVfcmVnaXN0ZXJz
X3doZW5fbm9fUFJPRklMSU5HX09OIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5t
aW4uaGUgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkPmJ1aWxkX2ZhaWx1cmUgPC90
ZD4KICAgICAgICAgICAgICAgICAgICAgICAgPHRkPmJ1aWxkIDxhIGhyZWY9Imh0dHA6Ly9ndnQt
amVua2lucy5zaC5pbnRlbC5jb206ODA4MC9qb2IvcGF0Y2gtdGVzdC1rdm1ndC8zNjUvY29uc29s
ZSI+MzY1PC9hPjwvdGQ+CiAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAg
IDwvdGFibGU+

--===============3902114786415279117==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM2NQpGYWlsZWQgdG8gYWRkIHRo
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
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpIRUFEIGlzIG5vdyBhdCBiOGQzMmRhNjNk
YzEgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAybS0xMmQtMTJoLTU2bS00MnMgQ1NUIGludGVncmF0aW9u
IG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy9taW4uaGUv
MTVfRmViXzIwMTlfMDFfNDJfMDMuZW1sCmh2OiBwYXNzLXRocnUgUE1VIHJlZ2lzdGVycyB3aGVu
IG5vIFBST0ZJTElOR19PTl88MjAxOTAyMTUwMTQyMDQuNjY1MC0xLW1pbi5oZUBpbnRlbC5jb20+
CkFwcGx5aW5nOiBodjogcGFzcy10aHJ1IFBNVSByZWdpc3RlcnMgd2hlbiBubyBQUk9GSUxJTkdf
T04KUGF0Y2ggZmFpbGVkIGF0IDAwMDEgaHY6IHBhc3MtdGhydSBQTVUgcmVnaXN0ZXJzIHdoZW4g
bm8gUFJPRklMSU5HX09OClRoZSBjb3B5IG9mIHRoZSBwYXRjaCB0aGF0IGZhaWxlZCBpcyBmb3Vu
ZCBpbjogLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2gKV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlz
IHByb2JsZW0sIHJ1biAiZ2l0IGFtIC0tY29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRvIHNraXAg
dGhpcyBwYXRjaCwgcnVuICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3JlIHRoZSBv
cmlnaW5hbCBicmFuY2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLgpl
cnJvcjogaHlwZXJ2aXNvci9hcmNoL3g4Ni9ndWVzdC92Y3B1aWQuYzogZG9lcyBub3QgZXhpc3Qg
aW4gaW5kZXgKZXJyb3I6IGh5cGVydmlzb3IvYXJjaC94ODYvZ3Vlc3Qvdm1zci5jOiBkb2VzIG5v
dCBleGlzdCBpbiBpbmRleAplcnJvcjogaHlwZXJ2aXNvci9kZWJ1Zy9oeXBlcmNhbGwuYzogZG9l
cyBub3QgZXhpc3QgaW4gaW5kZXgKZXJyb3I6IGh5cGVydmlzb3IvZGVidWcvcHJvZmlsaW5nLmM6
IGRvZXMgbm90IGV4aXN0IGluIGluZGV4Cg==

--===============3902114786415279117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============3902114786415279117==--
