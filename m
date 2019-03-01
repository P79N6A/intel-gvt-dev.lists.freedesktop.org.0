Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp284689ywe;
        Thu, 28 Feb 2019 23:04:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqx22vyKvVh2F9vYbY4MzjM8PmXRgu0dlQugMAlvPf6DCY6uYGuHXh4D3BQp9T4kOlXARqHZ
X-Received: by 2002:a63:8441:: with SMTP id k62mr3238136pgd.219.1551423873308;
        Thu, 28 Feb 2019 23:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551423873; cv=none;
        d=google.com; s=arc-20160816;
        b=YoZNveqIR9KVqaj20UO3uGZyYPg4FSJHaEkovsKVjLmZ9MxTWq6E74ldZ/Ie13KbM/
         jpkdEPyhNRgdU0ocJV7RplGniuyQJHkGcxBfF7O+yu8WJmT/6jM56W7YO10al53xl3dT
         S9bmSByJYIloKVZLbCm4q9zU0BLPnHPJXPFvSnTXVSyJTUFSAkGTlnqmWlQrTwPcRJlN
         165dlYI/47r2QEXQ87Da9+ra+OE/0WwWGiroyVHVHEsP+XGjN6bvUyxVOwrXj90trHTI
         gItkFh3y8G+HrJWqDdQ6QsQey4oeHuwytxtsA9Mc3UwszYKnOD18z+xkhdO9GBbxLUQd
         jVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=/x98EWSmjMH/EG7PeyOo0qPDj4uG1u/L3lBxTp04KKo=;
        b=g9KY4qjbPx92zVkqHy9c57cISqjETL63TyopsCHFpWd02tqJsldLQ6/6riU9mHWDYS
         97hdlsyTypCaa3BR9nkgPm04VcAdXdX1i0dDKaV8tWFDxqRMc864XhWrm/Ul6V8me74/
         w7uPRdoaJO2f7BSuxAy5hCgXCtozCxr8dBUsf5QNypIN2DNNWOkITbRnBCBdIKFizvML
         PSQWDipIt+mn47bl3bM0KsMAUddCVgeXREjSteFhJjRB2TIv6T4BeXbNFL6ZG0I8YrY9
         +dfpva6vPlQL4NfX/ptzDwXxwUfUpFbQCVHUABvz2+jQYYSRD08KH4IN/a4tCHCBzJuy
         HSVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n14si6598280pgv.520.2019.02.28.23.04.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 23:04:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916176E261;
	Fri,  1 Mar 2019 07:04:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0D6E261
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 07:04:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 23:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,426,1544515200"; d="scan'208";a="147580507"
Received: from debian-nuc.sh.intel.com ([10.239.160.36])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2019 23:04:29 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/i915/gvt: Don't submit request for error workload
 dispatch
Date: Fri,  1 Mar 2019 15:04:11 +0800
Message-Id: <20190301070413.6036-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228095542.23356-1-zhenyuw@linux.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QXMgdkdQVSBzaGFkb3cgY3R4IGlzIGxvYWRlZCB3aXRoIGd1ZXN0IGNvbnRleHQgc3RhdGUsIGFy
Yml0cmFyaWx5CnN1Ym1pdHRpbmcgcmVxdWVzdCBpbiBlcnJvciB3b3JrbG9hZCBkaXNwYXRjaCBw
YXRoIHdvdWxkIGNhdXNlIHRyb3VibGUuClNvIGRvbid0IHRyeSB0byBzdWJtaXQgaW4gZXJyb3Ig
cGF0aCBub3cgbGlrZSBpbiBwcmV2aW91cyBjb2RlLgpUaGlzIGlzIHRvIGZpeCBWTSBmYWlsdXJl
IHdoZW4gR1BVIGhhbmcgaGFwcGVucy4KCkZpeGVzOiBmMGU5OTQzNzI1MTggKCJkcm0vaTkxNS9n
dnQ6IEZpeCB3b3JrbG9hZCByZXF1ZXN0IGFsbG9jYXRpb24gYmVmb3JlIHJlcXVlc3QgYWRkIikK
UmV2aWV3ZWQtYnk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5k
ZXggMWJiOGY5MzZmZGFhLi41YjU5Y2JhOWY5M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2No
ZWR1bGVyLmMKQEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dvcmtsb2Fk
KHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkKIHsKIAlzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSA9IHdvcmtsb2FkLT52Z3B1OwogCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7CisJc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7
CiAJaW50IHJpbmdfaWQgPSB3b3JrbG9hZC0+cmluZ19pZDsKIAlpbnQgcmV0OwogCkBAIC03MDMs
NiArNzA0LDEzIEBAIHN0YXRpYyBpbnQgZGlzcGF0Y2hfd29ya2xvYWQoc3RydWN0IGludGVsX3Zn
cHVfd29ya2xvYWQgKndvcmtsb2FkKQogCiAJcmV0ID0gcHJlcGFyZV93b3JrbG9hZCh3b3JrbG9h
ZCk7CiBvdXQ6CisJaWYgKHJldCkgeworCQkvKiBXZSBtaWdodCBzdGlsbCBuZWVkIHRvIGFkZCBy
ZXF1ZXN0IHdpdGgKKwkJICogY2xlYW4gY3R4IHRvIHJldGlyZSBpdCBwcm9wZXJseS4uICovCisJ
CXJxID0gZmV0Y2hfYW5kX3plcm8oJndvcmtsb2FkLT5yZXEpOworCQlpOTE1X3JlcXVlc3RfcHV0
KHJxKTsKKwl9CisKIAlpZiAoIUlTX0VSUl9PUl9OVUxMKHdvcmtsb2FkLT5yZXEpKSB7CiAJCWd2
dF9kYmdfc2NoZWQoInJpbmcgaWQgJWQgc3VibWl0IHdvcmtsb2FkIHRvIGk5MTUgJXBcbiIsCiAJ
CQkJcmluZ19pZCwgd29ya2xvYWQtPnJlcSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
