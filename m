Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp462540ywb;
        Fri, 22 Mar 2019 02:21:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuMW5Irzczsl3dxqEp0L+wnWI3FaLD0Ova6IjzdChEhpXpD59npOYRNIu1UsZAPRrvEdhx
X-Received: by 2002:aa7:8615:: with SMTP id p21mr7967980pfn.98.1553246495958;
        Fri, 22 Mar 2019 02:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553246495; cv=none;
        d=google.com; s=arc-20160816;
        b=dXPoXo69IkR3s/siS4k+y9PtkgnIsfzb7kdWEpRoIYJ4knoS46xrlxzAHRGAx+gu6q
         uIItdGPz372WHgD2QFUh8J7+XNe6esisXWttZJ7kblB56hKOxshzlkPEab00fhE1BlaJ
         R0ZP1vcR5Sl2K0yvjcMuqZJjAbCYDqaYQ1JUIFhA/3OzLvDnkLIWKToVfsnhezN6xagu
         NQ9xIJQvP3IQ7qMLeaBv18zcxL6JVAMeCctQGb9cnlQm85tXku1sS3zXYnItoU02vBUu
         HeJz/6P6ArbHHFbIKye2phRxXqzkeq3Xp6x5z0BVVGf48nWbFBZR4daiEcjRIhspvpTI
         VWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=mU0VVcnybC0aJJpf/cM/d0NVBmeepj6m0mJLjkP+cnk=;
        b=rLBrUTZkwUas1X7pTjSCVvZjyoXR+UynahmKEyZhz3TjOBwzKaL6Aoe0EoiVVKz7UU
         Pp0Q9v72KD7CVGhuZ2bGmCWzx1wdwAjds4bX1JxpJFOEQHcDJ6spR1VpQH0R4ixg6LrJ
         uUqQfkpAjzktx0tYOd73rFBd3HAbjmG890nskOIwfe4JoIN8Rzd00sye3GsiyO+LBF7r
         j770BZ8MBTyL3/pNNUM0S5ZsmTrYkQp4W3wNAA8nkEth0dIgkEf9YS/kWh5mTj/9Clrc
         JBsGGu4BljVaHWWF7RyVZjn0yPjrGRNyX53niPM3yXrLotrSt3DxGMRrmyUPlg+ZW8Gb
         k+0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p10si6367061plk.413.2019.03.22.02.21.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2019 02:21:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2FA89E01;
	Fri, 22 Mar 2019 09:21:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2644089E01
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 09:21:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Mar 2019 02:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; 
 d="log'?scan'208";a="329659379"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2019 02:21:33 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 22 Mar 2019 02:21:31 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 22 Mar 2019 02:21:30 -0700
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 22 Mar
 2019 17:21:10 +0800
Content-Type: multipart/mixed; boundary="===============6394252583876094592=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [RFC_PATCH_intel-gvt-linux]_drm/i915/gvt:_vReg_ops_can_be_static
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190322091822.GA103701@athens>
Message-ID: <53c72b2a-7061-4d65-8ad4-7aabc73e56ee@shsmsx104.ccr.corp.intel.com>
Date: Fri, 22 Mar 2019 17:21:10 +0800
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

--===============6394252583876094592==
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
eHQtYWxpZ249ImNlbnRlciI+W1JGQ19QQVRDSF9pbnRlbC1ndnQtbGludXhdX2RybS9pOTE1L2d2
dDpfdlJlZ19vcHNfY2FuX2JlX3N0YXRpYyA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8
dGQ+bGtwIDwvdGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZF9mYWlsdXJlIDwv
dGQ+CiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD5idWlsZCA8YSBocmVmPSJodHRwOi8vZ3Z0
LWplbmtpbnMuc2guaW50ZWwuY29tOjgwODAvam9iL3BhdGNoLXRlc3Qta3ZtZ3QvMzk5L2NvbnNv
bGUiPjM5OTwvYT48L3RkPgogICAgICAgICAgICAgICAgICAgIDwvdHI+CiAgICAgICAgICAgICAg
ICA8L3RhYmxlPg==

--===============6394252583876094592==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM5OQpGYWlsZWQgdG8gYWRkIHRo
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
Ni90b29scwogIENMRUFOICAgLnRtcF92ZXJzaW9ucwpIRUFEIGlzIG5vdyBhdCAzZjhlMjE2MzEy
YjkgZ3Z0LXN0YWdpbmc6IDIwMTl5LTAzbS0xOGQtMTBoLTU2bS00NXMgQ1NUIGludGVncmF0aW9u
IG1hbmlmZXN0CkFscmVhZHkgdXAtdG8tZGF0ZS4KU3RhcnQKL3Jvb3QvcGF0Y2hlcy9sa3AvMjJf
TWFyXzIwMTlfMTdfMThfMjIuZW1sCmRybS9pOTE1L2d2dDogdlJlZ19vcHMgY2FuIGJlIHN0YXRp
Y188MjAxOTAzMjIwOTE4MjIuR0ExMDM3MDFAYXRoZW5zPgpBcHBseWluZzogZHJtL2k5MTUvZ3Z0
OiB2UmVnX29wcyBjYW4gYmUgc3RhdGljClBhdGNoIGZhaWxlZCBhdCAwMDAxIGRybS9pOTE1L2d2
dDogdlJlZ19vcHMgY2FuIGJlIHN0YXRpYwpUaGUgY29weSBvZiB0aGUgcGF0Y2ggdGhhdCBmYWls
ZWQgaXMgZm91bmQgaW46IC5naXQvcmViYXNlLWFwcGx5L3BhdGNoCldoZW4geW91IGhhdmUgcmVz
b2x2ZWQgdGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVlIi4KSWYgeW91IHByZWZl
ciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4KVG8gcmVz
dG9yZSB0aGUgb3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5nLCBydW4gImdpdCBhbSAt
LWFib3J0Ii4KZXJyb3I6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmM6IGRvZXMg
bm90IGV4aXN0IGluIGluZGV4Cg==

--===============6394252583876094592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============6394252583876094592==--
