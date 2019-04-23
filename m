Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3351946ywo;
        Tue, 23 Apr 2019 05:05:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4V8EfX8UUkhhv3vnhLOoCPv7Qj2HlOdPsu4333e81k5IY99IH7e6uX8n7O9KonbdtB6fY
X-Received: by 2002:a62:61c2:: with SMTP id v185mr26408899pfb.117.1556021141102;
        Tue, 23 Apr 2019 05:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021141; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeBACMtx2X+3wx59tAnwhTkvjIE69YpLtAzD6wO/AzEyVFBgiWCHCFbeoZ+rQZelRH
         E/y15sPQrsp2cHAPRgkEND9bUX3WzwQQdJBpPGkPLZoQZ1AB/J6N2rusIawQSvWTuYKX
         ay3hagpVmtNIlu29uXilYa4i3Ewwa/uS5A0s9ifc69urJNB/A9ypYmjv5F/GyKEqEeRC
         8FTCYpkxT+DMNI/URhm+FA+KlxIaEHFgDGHinpxp/DYsksvM1AR5y9hSnxsdACo4VQIM
         9T4impRAXbNYg55Nbpr0Y37jxSGSMv9l877+Q96QKglJC5FQ9rq3UICRUvilTNgaktup
         MjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=qN7yf4YHUoRQ+ag1tcOBZZ6jIr455/GLQ7G7xIW9uQ0=;
        b=XWYThC6smOq1JXoViyCj/bH7lzlZlGJYmqmwfspR9kpj0qiTnv7dBRLTNNi+2uuylR
         NHK/aFEeV7+6R/5C8jD1hPWhRR2T/guFzl6gAUzg69+s/JNKFtm1Vof18xXS2dJcPT7R
         QMICzYltVIC0eHzcMcOZwQD0T586gl3ZaO0rC9iXy13JQtUlAoeCHl17F+4fYkrxYASz
         4FWTXKXXQiRBeOPu4PKcLQtZPC69VCdT15sRjTHusHAe+G28KOhfLTRgJKrovEnoZUhX
         9hyJl53POiItDOFCqo+iJBYC0trPwRFi2aAeGx7gojWkbHuUSnBDyiGq2+83VgiUq/Wj
         q/5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f22si4827682pgf.227.2019.04.23.05.05.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C7689308;
	Tue, 23 Apr 2019 12:05:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEE08928D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002229"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:36 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/i915/gvt: Do not copy the uninitialized pointer
 from fb_info
Date: Tue, 23 Apr 2019 15:04:09 +0300
Message-Id: <20190423120413.30929-3-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW4gdGhlIGNvZGUgdGhlIG1lbWNweSgpIGZ1bmN0aW9uIGNvcGllZCB1bmluaXRpYWxpemVkIHBv
aW50ZXIgaW4gZmJfaW5mbwp0byBkbWFidWZfb2JqLT5pbmZvLiBMYXRlciB0aGUgcG9pbnRlciBp
biBkbWFidWZfb2JqLT5pbmZvIHdpbGwgYmUKaW5pdGlhbGl6ZWQuIFRvIG1ha2UgdGhlIGNvZGUg
YWxpZ25lZCB3aXRoIHJlcXVpcmVtZW50cyBvZiB0aGUga2xvY3dvcmsKc3RhdGljIGNvZGUgYW5h
bHl6ZXIsIHRoZSB1bmluaXRpYWxpemVkIHBvaW50ZXIgc2hvdWxkIGJlIGluaXRpYWxpemVkCmJl
Zm9yZSBtZW1jcHkoKS4KCnYyOgotIEluaXRpYWxpemUgZmJfaW5mby5vYmogaW4gdmdwdV9nZXRf
cGxhbmVfaW5mbygpLiAoQ29saW4gWHUpCgpUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWNhbCBp
c3N1ZSAjNjMyIHJlcG9ydGVkIGJ5IGtsb2Nrd29yay4KClNpZ25lZC1vZmYtYnk6IEFsZWtzZWkg
R2ltYml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KQ2M6IFpoZW55dSBXYW5n
IDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4KQ2M6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCA0ZTFlNDI1MTg5YmEuLjkzYTg5
NTY5ZjkyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwpAQCAtMjExLDYgKzIxMSw4IEBA
IHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CXN0cnVjdCBpbnRlbF92Z3B1X2N1cnNvcl9wbGFuZV9mb3JtYXQgYzsKIAlpbnQgcmV0LCB0aWxl
X2hlaWdodCA9IDE7CiAKKwltZW1zZXQoaW5mbywgMCwgc2l6ZW9mKCppbmZvKSk7CisKIAlpZiAo
cGxhbmVfaWQgPT0gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSkgewogCQlyZXQgPSBpbnRlbF92Z3B1
X2RlY29kZV9wcmltYXJ5X3BsYW5lKHZncHUsICZwKTsKIAkJaWYgKHJldCkKLS0gCjIuMTcuMQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkludGVsIEZpbmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEs
IDAwMTgxIEhlbHNpbmtpIApCdXNpbmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9t
aWNpbGVkIGluIEhlbHNpbmtpIAoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkg
Y29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lw
aWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
