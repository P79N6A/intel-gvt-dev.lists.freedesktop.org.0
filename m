Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3351910ywo;
        Tue, 23 Apr 2019 05:05:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlM9ogDEHArJSTHeyFCpDrmg+HAmH4fF8lC3846lwaB6g41LGVWyDIs6ZAZz4Ohux4lOH+
X-Received: by 2002:a17:902:9043:: with SMTP id w3mr25992048plz.101.1556021138428;
        Tue, 23 Apr 2019 05:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556021138; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1JzAjnRGqww105zts0Wyima+iRQPq7WzMk5RkwfZu72i/Ce9FtHGZ9M5uFKZlB9TX
         H0Z8yoZBoWmQd/7ZRvvGtJ72D4ld7LJRHFnexVNP6d9WPHrBYchWpOHMLPS7NYipaYRH
         6P/AcLZmX0z8gwtapHyvSQNPeNru/xT34mwB9GGIuF+DvPih+YlPjr5rDtcSMNoHsXsV
         VIDHEWkz/iJ/BpQaNRzPwn3vSy1r4qrhUZk7WyN4OuC4cVCMuCwEjHDf78jvj9/vaW09
         dDtozWalT/O8MVgD4SCPEmAdeqlXQ4MUxOteaw/ibilPVk6DLqMYUE0jjiTXU0UkbzxK
         3QTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=nn0/q9ye0a8ogAmWvpTP5IZZOQ2rW+yYDt72OI8fCIU=;
        b=Omi+vishLUH0mWtvXKLbjjV6JdyVZiskBCbDrkKlIv3iGrkzROliryIs9Cot0yLuAL
         Pm6Lh8ci1t6TXXUHs3uG3DAjfEmeeJfmHcGXp5jHkOc+OLuoYB+gYxy1veFZsEeRq29K
         dteMwwr/YB+1WIQ5X7ZYVHEup5yPNMxgilsJ5LBl/gJgex4lx3GIinBickFZ3MWJ6H4f
         p4CzMRnWLaHRjY+l124A9fy0lhwLTTL6X2sihl6beSNv3hqGCJo++3iv0egLsRbfQKmW
         WAs8kb6Mp8Tod7uocd5TOerpcA9oM9qXgAo/Otx6EVgjolJgYvORUDA0zqo33N122dqt
         sxzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id ci14si16464114plb.264.2019.04.23.05.05.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 05:05:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C69E89079;
	Tue, 23 Apr 2019 12:05:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005F89079
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 12:05:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 05:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="340002211"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga006.fm.intel.com with ESMTP; 23 Apr 2019 05:05:33 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/6] Fix issues reported by klocwork
Date: Tue, 23 Apr 2019 15:04:07 +0300
Message-Id: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGZvdW5kIDExIGNyaXRpY2FsIGlzc3Vl
cyBhbmQgNyBlcnJvcgppc3N1ZXMgaW4gR1ZULWcgc291cmNlIGNvZGUuIEFmdGVyIHRoZSBhbmFs
eXphdGlvbiwgb25lIGNyaXRpY2FsIGlzc3VlCmFuZCA2ICJlcnJvcnMiIHdhcyBjb25jbHVkZWQg
YXMgaGFybWxlc3MuIFRoaXMgcGF0Y2hzZXQgZml4ZXMgb3RoZXIKY2FzZXMsIHdoaWNoIG1pZ2h0
IGNhdXNlIHBvdGVudGlhbCBpc3N1ZXMgaW4gZnV0dXJlLgoKdjM6Ci0gUmVtb3ZlIHR5cGVkZWYg
YW5kIGxldCB0aGUgZW51bWVyYXRpb24gc3RhcnRzIGZyb20gemVyby4KClYyOgotIFByaW50IHNv
bWUgZXJyb3IgbWVzc2FnZXMgaWYgcGFnZSB0YWJsZSB0eXBlIGlzIGludmFsaWQuIChDb2xpbiBY
dSkKLSBJbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVyLiAoQ29saW4gWHUpCi0gSW5pdGlh
bGl6ZSBmYl9pbmZvLm9iaiBpbiB2Z3B1X2dldF9wbGFuZV9pbmZvKCkuIChDb2xpbiBYdSkKCkFs
ZWtzZWkgR2ltYml0c2tpaSAoNik6CiAgZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBhbmQg
bGV0IHRoZSBlbnVtZXJhdGlvbiBzdGFydHMgZnJvbSB6ZXJvCiAgZHJtL2k5MTUvZ3Z0OiBEbyBu
b3QgY29weSB0aGUgdW5pbml0aWFsaXplZCBwb2ludGVyIGZyb20gZmJfaW5mbwogIGRybS9pOTE1
L2d2dDogVXNlIHNucHJpbnRmKCkgdG8gcHJldmVudCBwb3NzaWJsZSBidWZmZXIgb3ZlcmZsb3cu
CiAgZHJtL2k5MTUvZ3Z0OiBDaGVjayBpZiBjdXJfcHRfdHlwZSBpcyB2YWxpZAogIGRybS9pOTE1
L2d2dDogQXNzaWduIE5VTEwgdG8gdGhlIHBvaW50ZXIgYWZ0ZXIgbWVtb3J5IGZyZWUuCiAgZHJt
L2k5MTUvZ3Z0OiBDaGVjayBpZiBnZXRfbmV4dF9wdF90eXBlKCkgYWx3YXlzIHJldHVybnMgYSB2
YWxpZCB2YWx1ZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMgICB8ICA0ICsr
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyAgICB8ICAyICsrCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCAgICAgICB8IDE2ICsrKysrKysr
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICB8ICAyICstCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCAgMiArLQogNiBmaWxlcyBjaGFu
Z2VkLCAzNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4
MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxl
ZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQs
IHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
