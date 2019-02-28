Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp271800ywe;
        Thu, 28 Feb 2019 00:31:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZagZQZuRHVVeDq+sVC1JBdV552Il7Gdmcy3Rmx8GQCZm+togxbxOIfZvnwHbms13r9mqq4
X-Received: by 2002:a63:a11:: with SMTP id 17mr7362608pgk.310.1551342661460;
        Thu, 28 Feb 2019 00:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551342661; cv=none;
        d=google.com; s=arc-20160816;
        b=OcxFnkrYybYsDBAQ3Wo76K12qQHeyLljkvuVJwU8BdkLfTIFHGFJ4K/4xqOyQyPbH6
         nUZe/HEJ6gyir2qBBdWDJnwiY6E/jb46Prz6DQwh1K6fETeifL/C2jk1k1KozniDMnPO
         1gdSUGG8MrfsbsQR5tjNkcJmzj6kB0YKX10B0YIIfPgrzLV8MIaHlRwIcrq5T4NBgKAE
         qDYDtAzIjiaAuQXFLVAGEGAXD3ZcmD4TDFbefTPGkZzQKtIk4fn3rWqGd3GnuanXIHW3
         uhvMF9BTy7EmX11DDyqS/VLlqqgnLvkaTzlTwTcA5yztWEfHsfNSjHIitj3Fye8Ri2w9
         GE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=hhU4PZrMtmb0AsUd7FLUCukqY9l24LVJErzJOdhQBHo=;
        b=ePJg7p6Q2mriWy4yXbRLqJSPGCcEbHbGP3csZEQmi7imeTOWwFI2PaFlS0Wq6xilwX
         mY0h5hgmVlD7YOTmHYi9ea6qn6cYkKFcVLvvyt76oua4l7mhr7aDLOZKc0fpVpilznry
         IgbxN7gdtdJRt7HLAQ88AhtirX82RkC68EEpGNi+rcWne6Sg0DdJWd8eoP8fZjFbqg/L
         kQL6qoDiKOrkfrZ0MlPSpLZqdapyeHOXr3lcVC4gRgIR+WGqgs3bm8RophTiQHVSLtPz
         4KWanlKpls3fFMVkj3Y3O7PZ9BupecLP5slWs7mejrpLq+G+U51FUnJ/mP22+hwcBDV9
         KBWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d16si17562583pgi.148.2019.02.28.00.31.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 00:31:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086506E15F;
	Thu, 28 Feb 2019 08:31:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1376E15F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Feb 2019 08:31:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 00:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,422,1544515200"; 
 d="log'?scan'208";a="142319422"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 28 Feb 2019 00:30:59 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 00:30:58 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 28 Feb 2019 00:30:58 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 28 Feb
 2019 16:30:55 +0800
Content-Type: multipart/mixed; boundary="===============6439535950005819891=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH]_drm/i915/gvt:_declare_the_vgpu_active_flag_as_atomic_t
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <1551341988-1410-1-git-send-email-weinan.z.li@intel.com>
Message-ID: <96722414-72a4-4f1f-9a56-d00974535e55@shsmsx104.ccr.corp.intel.com>
Date: Thu, 28 Feb 2019 16:30:55 +0800
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

--===============6439535950005819891==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIXV9kcm0vaTkxNS9ndnQ6X2RlY2xhcmVfdGhlX3ZncHVf
YWN0aXZlX2ZsYWdfYXNfYXRvbWljX3QgPC90ZD4KICAgICAgICAgICAgICAgICAgICAgICAgPHRk
PndlaW5hbi56LmxpIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZF9mYWls
dXJlIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBocmVmPSJodHRw
Oi8vZ3Z0LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qta3ZtZ3QvMzgw
L2NvbnNvbGUiPjM4MDwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAg
ICAgICAgICA8L3RhYmxlPg==

--===============6439535950005819891==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM4MApGYWlsZWQgdG8gYWRkIHRo
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
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpIRUFEIGlzIG5vdyBhdCA2MmU4Nzg2Nzkx
OWMgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAybS0yMmQtMTZoLTIwbS00MnMgQ1NUIGludGVncmF0aW9u
IG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy93ZWluYW4u
ei5saS8yOF9GZWJfMjAxOV8xNl8xOV80OC5lbWwKZHJtL2k5MTUvZ3Z0OiBkZWNsYXJlIHRoZSB2
Z3B1IGFjdGl2ZSBmbGFnIGFzIGF0b21pY190XzwxNTUxMzQxOTg4LTE0MTAtMS1naXQtc2VuZC1l
bWFpbC13ZWluYW4uei5saUBpbnRlbC5jb20+CmVycm9yOiBwYXRjaCBmYWlsZWQ6IGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYzo3MzkKZXJyb3I6IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9zY2hlZHVsZXIuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkKQXBwbHlpbmc6IGRybS9p
OTE1L2d2dDogZGVjbGFyZSB0aGUgdmdwdSBhY3RpdmUgZmxhZyBhcyBhdG9taWNfdApQYXRjaCBm
YWlsZWQgYXQgMDAwMSBkcm0vaTkxNS9ndnQ6IGRlY2xhcmUgdGhlIHZncHUgYWN0aXZlIGZsYWcg
YXMgYXRvbWljX3QKVGhlIGNvcHkgb2YgdGhlIHBhdGNoIHRoYXQgZmFpbGVkIGlzIGZvdW5kIGlu
OiAuZ2l0L3JlYmFzZS1hcHBseS9wYXRjaApXaGVuIHlvdSBoYXZlIHJlc29sdmVkIHRoaXMgcHJv
YmxlbSwgcnVuICJnaXQgYW0gLS1jb250aW51ZSIuCklmIHlvdSBwcmVmZXIgdG8gc2tpcCB0aGlz
IHBhdGNoLCBydW4gImdpdCBhbSAtLXNraXAiIGluc3RlYWQuClRvIHJlc3RvcmUgdGhlIG9yaWdp
bmFsIGJyYW5jaCBhbmQgc3RvcCBwYXRjaGluZywgcnVuICJnaXQgYW0gLS1hYm9ydCIuCg==

--===============6439535950005819891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============6439535950005819891==--
