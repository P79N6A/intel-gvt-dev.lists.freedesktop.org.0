Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6532807ywo;
        Wed, 10 Apr 2019 22:54:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsTyYIF/oEgzHX0tSXReaJHZ4J9RRfbfXpWbGxjyLBlvqpFuXL2rqSP/7HcMhwusXag4CW
X-Received: by 2002:a17:902:d889:: with SMTP id b9mr48222382plz.294.1554962096502;
        Wed, 10 Apr 2019 22:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554962096; cv=none;
        d=google.com; s=arc-20160816;
        b=DDz8o8zldna+XhIxiJ7n7CyW48X/FxnRj6scCV1C11gvI7hjMxDbDVSBlKOSZYP+OB
         aTEHKSM8zaLG4SR3r9CTYjOhiWUeLW66ayhlP6H7hu1uRjx2W4C3VDSsx3UsIkVOe3G8
         a63UBWgl1Pr3JDwWfxr9dcV3agPRlfI2rM5ArGlc50rDNHwOZeRDlCzDHdA45oyI/6af
         gEViatm93Bee+cBfjHE+HZdJKNHZvWVJBPTK/TzAF8MyofzQzxjzsGwrKfp/q6EqaGp4
         UM45t1seOHr6YL+3Za7ROm3urqR/H/0+HOUPAvVzkorrZQa2TMqRveqIDj7Uq44mOXyf
         Yx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :delivered-to;
        bh=ICGAb+fJOZTf2MVR72gjafwAtk2n3HvU6Vb04i2oZ44=;
        b=qPMaDeBkge7j5HGbBIkmYqBqbN7LYqT8wExL9lG0Z5LJISwd7n9ZIKYVhbv3RMMjLu
         EB9he+cJxlMKcOFOGqhwO7M0oTc4Z+aHYJUlUUsq97Du8vGAMM9k6fCg+5NTUnxu4joW
         6/yd3kwE+IqNtQm2pcjYrO9FzgLftU8XT0ggO8hNhhIebaBQRWGD7/qphqsQYNxMzI/s
         AjpOjg1NwJG+QszDnH+l0ydzP5j5uJGGzZESTZ33nKy8M/XTCPFu6An6ojDOMYVK+lkS
         Yfgd6pUSxSCy2vMvPKTJ9OvGS49BemgKkL2IcHbffNh3ZStxeLWMa4HHcQBDLg1rXXcN
         kVqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z23si33845965pfn.99.2019.04.10.22.54.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 22:54:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201B489804;
	Thu, 11 Apr 2019 05:54:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7E589804;
 Thu, 11 Apr 2019 05:54:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 22:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; d="scan'208";a="149877106"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga002.jf.intel.com with ESMTP; 10 Apr 2019 22:54:53 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 10 Apr 2019 22:54:53 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 10 Apr 2019 22:54:53 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.153]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.206]) with mapi id 14.03.0415.000;
 Thu, 11 Apr 2019 13:54:51 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/8] i915 vgpu PV to improve vgpu performance
Thread-Topic: [PATCH v4 0/8] i915 vgpu PV to improve vgpu performance
Thread-Index: AQHU8CsTKg+s/9V450KwLX27uGUX+Q==
Date: Thu, 11 Apr 2019 05:54:51 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608764976F@SHSMSX107.ccr.corp.intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
 <155387550368.24691.11565135264178401270@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.160]
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "He, Min" <min.he@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDMvMzAvMjAxOSAxMjowNSBBTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wMy0yOSAxMzozMjozNikKPj4gVG8gaW1wcm92ZSB2Z3B1IHBlcmZv
cm1hbmNlLCBpdCBjb3VsZCBpbXBsZW1lbnQgc29tZSBQViBvcHRpbWl6YXRpb24KPj4gc3VjaCBh
cyB0byByZWR1Y2UgdGhlIG1taW8gYWNjZXNzIHRyYXAgbnVtYmVycyBvciBlbGltaW5hdGUgY2Vy
dGFpbiBwaWVjZQo+PiBvZiBIVyBlbXVsYXRpb24gd2l0aGluIGd1ZXN0IGRyaXZlciB0byByZWR1
Y2Ugdm0gZXhpdC92bSBlbnRlciBjb3N0Lgo+IFdoZXJlJ3MgdGhlIENJIGZvciB0aGlzIHBhdGNo
c2V0PyBUaGUgbGFjayBvZiBpbnRlcnJ1cHRzIHRvIGRyaXZlCj4gc3VibWlzc2lvbiBzaG91bGQg
aGF2ZSBzaG93biB1cCwgYW5kIGlmIG5vdCwgd2UgbmVlZCBzb21lIHRlc3RjYXNlcyB0bwo+IG1h
a2Ugc3VyZSBpdCBkb2Vzbid0IGhhcHBlbiBhZ2Fpbi4gRXZlcnl0aW1lIEkgc2VlIGEgZ3Z0IHBh
dGNoLCBJIGFzayBpZgo+IHdlIGNhbiBnZXQgc29tZSBjb3ZlcmFnZSBpbiBpbnRlbC1nZngtY2kg
OikKPiAtQ2hyaXMKPgpUaGUgQ0kgZm9yIHRoaXMgcGF0Y2hzZXQgd2FzIG5vdCBnZW5lcmF0ZWQg
ZHVlIHRvIGJ1aWxkIGZhaWx1cmUuIHdpbGwKdHJ5IG5leHQgdmVyc2lvbiB0byBhdm9pZCBidWls
ZCBpc3N1ZSBieSByZWJhc2luZyB0byB0aXAgb2YgYnJhbmNoLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
