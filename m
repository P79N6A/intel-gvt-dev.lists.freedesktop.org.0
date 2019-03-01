Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp666274ywe;
        Fri, 1 Mar 2019 06:41:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaF4XpAsox43B4L352qabk4pdq8kC1TWWTecQAZOtiHxjktL+Ab5o9v8hxZlY3OqQ+wxxt
X-Received: by 2002:a17:902:7e46:: with SMTP id a6mr5822957pln.150.1551451300154;
        Fri, 01 Mar 2019 06:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551451300; cv=none;
        d=google.com; s=arc-20160816;
        b=txSUh5Udp7gbTskFzAfQ0y1IVqkkv6mJuAzwcr1Xcin7xoXxXDr1G4qZbYilyL5/yN
         ER7E5EJoDZG3lf0+YwiKpkIYhWR9SPKWyd0ZhH7h9IANDaYQuzuQR+olxzUpP4zFvdEE
         qdMYQKvqL24axPQE0askBpKQebbylJHY1953GUDD6mG3iqYMkxW8u6TLqc3bJN/Bxmd4
         kPGKMZTBS+vXZT+C2Z5ClkLvmy7P43M6JvACE74YgA/R3RRQef5FF4AvaFkief16Sr0B
         b/YKpG2YZ/xMbAZip2vVCDMuoe3dajxR7w4vPzE5bCq78H6SaNdjLVdJhl5iFBEYQAXp
         V+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:message-id:in-reply-to:to
         :from:subject:mime-version:delivered-to;
        bh=vGAULo2vKKJnGqHbqwep5mxhC/sDSaSH7jaLgDUv6pw=;
        b=Ef9X+t5McRtJISD8ZxK6YeUqrW9SDLYFdKgd4Xb2U3mPEyB51U6Y1do3LdZJjsBH0I
         0xIV++ki3ghnBbgz2Y9fY9dZRoJ9kUXJYIhlXK2hSPK7j23jCHXywt3jXYJ9gFPXuHc4
         qDgRFSn21Kl+G6opBcfb2Ujx6wbnChWqN8zYOQaXkkGNkrlR2iFFPoQBDwAcPscZZZp7
         OGKoIoJ1YWJDbIz5VlcXzKAQ+ChsONrTDfnNfdtdQOXIdYCfIeKUobVau+o15GIQmSe5
         Clf+VAzikGQikiaslqD6r7kR0KLqUDDFs8ddA0jsoMnMjh8LhW605TktR1BIX7pCKAcs
         GpqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h66si3698816pgc.537.2019.03.01.06.41.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 06:41:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEF86E2EE;
	Fri,  1 Mar 2019 14:41:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3BC6E2EE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 14:41:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2019 06:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,427,1544515200"; 
 d="log'?scan'208";a="148411207"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2019 06:41:38 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 06:41:37 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 1 Mar 2019 06:41:37 -0800
Received: from [127.0.1.1] (10.239.48.224) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 1 Mar 2019
 22:41:35 +0800
Content-Type: multipart/mixed; boundary="===============7908107643566962441=="
MIME-Version: 1.0
Subject: Jenkins Job Failed for Patch
 [PATCH_v2_1/3]_drm/i915/gvt:_Dont_submit_request_for_error_workload_dispatch
From: <lab_gvt-test@intel.com>
To: <intel-gvt-dev@lists.freedesktop.org>
In-Reply-To: <20190301070413.6036-1-zhenyuw@linux.intel.com>
Message-ID: <c6c36c6b-e281-4435-9cda-2277e6627104@shsmsx104.ccr.corp.intel.com>
Date: Fri, 1 Mar 2019 22:41:35 +0800
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

--===============7908107643566962441==
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
eHQtYWxpZ249ImNlbnRlciI+W1BBVENIX3YyXzEvM11fZHJtL2k5MTUvZ3Z0Ol9Eb250X3N1Ym1p
dF9yZXF1ZXN0X2Zvcl9lcnJvcl93b3JrbG9hZF9kaXNwYXRjaCA8L3RkPgogICAgICAgICAgICAg
ICAgICAgICAgICA8dGQ+emhlbnl1dyA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+
YnVpbGRfZmFpbHVyZSA8L3RkPgogICAgICAgICAgICAgICAgICAgICAgICA8dGQ+YnVpbGQgPGEg
aHJlZj0iaHR0cDovL2d2dC1qZW5raW5zLnNoLmludGVsLmNvbTo4MDgwL2pvYi9wYXRjaC10ZXN0
LWt2bWd0LzM4My9jb25zb2xlIj4zODM8L2E+PC90ZD4KICAgICAgICAgICAgICAgICAgICA8L3Ry
PgogICAgICAgICAgICAgICAgPC90YWJsZT4=

--===============7908107643566962441==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="build.log"

W3BhdGNoLXRlc3Qta3ZtZ3RdIFJ1bm5pbmcgc2hlbGwgc2NyaXB0Cisgc3NoIHJvb3RAYnVpbGRz
ZXJ2ZXItaWxhYi5zaC5pbnRlbC5jb20gY2QgL3Jvb3QvcGF0Y2gtdGVzdC1rdm1ndC87IC4vYnVp
bGQtd2l0aC1wYXRjaC5zaCAvcm9vdC9idWlsZC9wYXRjaGVzIDM4MwpGYWlsZWQgdG8gYWRkIHRo
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
bnRlbC9ndnQtbGludXgKICsgNjJlODc4Njc5MTljLi4uZWY0NDI2NzA3OWM4IGd2dC1zdGFnaW5n
IC0+IG9yaWdpbi9ndnQtc3RhZ2luZyAgKGZvcmNlZCB1cGRhdGUpCiAgIDFlOGIxNWExOTg4ZS4u
ZjU1MmU3YmQwMjhmICBndnQtZml4ZXMgICAtPiBvcmlnaW4vZ3Z0LWZpeGVzCiAqIFtuZXcgdGFn
XSAgICAgICAgICAgICAgICAgICBndnQtc3RhZ2luZy0yMDE5eS0wM20tMDFkLTE1aC01Nm0tMjJz
IC0+IGd2dC1zdGFnaW5nLTIwMTl5LTAzbS0wMWQtMTVoLTU2bS0yMnMKSEVBRCBpcyBub3cgYXQg
ZWY0NDI2NzA3OWM4IGd2dC1zdGFnaW5nOiAyMDE5eS0wM20tMDFkLTE1aC01Nm0tMjJzIENTVCBp
bnRlZ3JhdGlvbiBtYW5pZmVzdApBbHJlYWR5IHVwLXRvLWRhdGUuClN0YXJ0Ci9yb290L3BhdGNo
ZXMvemhlbnl1dy8xX01hcl8yMDE5XzE1XzA0XzExLmVtbAoKQXBwbHlpbmc6IGRybS9pOTE1L2d2
dDogRG9uJ3Qgc3VibWl0IHJlcXVlc3QgZm9yIGVycm9yIHdvcmtsb2FkIGRpc3BhdGNoClBhdGNo
IGZhaWxlZCBhdCAwMDAxIGRybS9pOTE1L2d2dDogRG9uJ3Qgc3VibWl0IHJlcXVlc3QgZm9yIGVy
cm9yIHdvcmtsb2FkIGRpc3BhdGNoClRoZSBjb3B5IG9mIHRoZSBwYXRjaCB0aGF0IGZhaWxlZCBp
cyBmb3VuZCBpbjogLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2gKV2hlbiB5b3UgaGF2ZSByZXNvbHZl
ZCB0aGlzIHByb2JsZW0sIHJ1biAiZ2l0IGFtIC0tY29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRv
IHNraXAgdGhpcyBwYXRjaCwgcnVuICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3Jl
IHRoZSBvcmlnaW5hbCBicmFuY2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJv
cnQiLgplcnJvcjogcGF0Y2ggZmFpbGVkOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1
bGVyLmM6Njc4CmVycm9yOiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmM6IHBh
dGNoIGRvZXMgbm90IGFwcGx5Ci9yb290L3BhdGNoZXMvemhlbnl1dy8xX01hcl8yMDE5XzE1XzA0
XzExLmVtbCBmYWlsZWQhCg==

--===============7908107643566962441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============7908107643566962441==--
