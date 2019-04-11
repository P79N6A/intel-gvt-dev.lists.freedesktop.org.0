Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6529682ywo;
        Wed, 10 Apr 2019 22:49:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlB7xuJ0DkjecsVtHbQmvyAmDjmScPYBmLBjDQ7X6owoPiO+YLwVYNX4EDGBa5qfEI+XBt
X-Received: by 2002:a65:4108:: with SMTP id w8mr44916096pgp.236.1554961794469;
        Wed, 10 Apr 2019 22:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554961794; cv=none;
        d=google.com; s=arc-20160816;
        b=va5GNYhDkVWlMOJtR05jX7GXiG+w8QHZSqZkZadoHPtI174wkm8hSXzEw7UV8EJtkT
         A+KyyQV1qc5PcvrD00UKJwPYIMbpGAJ+ZuMHVqXOiTyQlA2QgsMH/kPHc1Q7zw7afYO8
         58Lvmx0JRIOEnBEzyc+c1JA2NIkaz1+XR4xoS+rtt8TpdPozmfqPrllyTW1akekrwjsi
         VDr6WM17v2B7VfCT31937MhviMwWlvBtkMgXgkqPc3KodH4Mdum5BICIyXDiR06dQnR9
         6Y6u9EyWm0g31/YUnWYm+TXMNdAABtgrtZx07lH5O+dbD5nE1sAOfE4OvstKDtExliiX
         kNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :delivered-to;
        bh=PTPsF6K+MPZnZOeRcq5LenRDvGtoCHJK6gsZOM8SliQ=;
        b=o6y4GjmQpqiwe4Qw7MmQE/Tlic1f6qqGSnC4TUA2cVdJtL6oy5GqcVakyDDQHEcrgs
         NxmZ7Jo8Z7ic5dq2JyrHE4GB/kiZa/Y04+1AX3+pWWcgq6V3jkbIAxGfCJbS6jfwWi1O
         MYZSvL2uX+ccsdUNQ14E/VgGxwBJj7GgQ9RJVrDT7g1Eb5Ka/wEak309F7//oTzp1c/I
         AKKIvQDXq7xSd513QWAZIlmrdce4tXHvB9K+pJFcDlDsl+gUxBC/TDL0rarAbOeZSEkP
         FZDQijY6eI0lv8eKnFZ0M4cYzSvTBGszayiaZSC7euMzE5bu/YzG6hMWM62kvSi8J/L/
         SD0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f96si11645660plb.267.2019.04.10.22.49.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 22:49:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC889805;
	Thu, 11 Apr 2019 05:49:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A8C89804;
 Thu, 11 Apr 2019 05:49:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 22:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; d="scan'208";a="335742643"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2019 22:49:51 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 10 Apr 2019 22:49:51 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 10 Apr 2019 22:49:51 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.153]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.93]) with mapi id 14.03.0415.000;
 Thu, 11 Apr 2019 13:49:49 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Thread-Topic: [PATCH v4 4/8] drm/i915: vgpu context submission pv optimization
Thread-Index: AQHU5eQVHTRFc4J84Uie4+snRAcfOA==
Date: Thu, 11 Apr 2019 05:49:48 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D446087649755@SHSMSX107.ccr.corp.intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
 <1553866364-111114-5-git-send-email-xiaolin.zhang@intel.com>
 <155388684392.24691.4103217140609550300@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.80]
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

T24gMDMvMzAvMjAxOSAwMzoxNCBBTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wMy0yOSAxMzozMjo0MCkKPj4gKyAgICAgICBzcGluX2xvY2soJmVu
Z2luZS0+aTkxNS0+dmdwdS5zaGFyZWRfcGFnZV9sb2NrKTsKPj4gKyAgICAgICBzaGFyZWRfcGFn
ZS0+cmluZ19pZCA9IGVuZ2luZS0+aWQ7Cj4+ICsgICAgICAgZm9yIChuID0gMDsgbiA8IGV4ZWNs
aXN0c19udW1fcG9ydHMoZXhlY2xpc3RzKTsgbisrKQo+PiArICAgICAgICAgICAgICAgc2hhcmVk
X3BhZ2UtPmRlc2NzW25dID0gZGVzY3Nbbl07Cj4+ICsKPj4gKyAgICAgICBfX3Jhd19pOTE1X3dy
aXRlMzIodW5jb3JlLCB2Z3RpZl9yZWcoZzJ2X25vdGlmeSksCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIFZHVF9HMlZfUFZfU1VCTUlTU0lPTik7Cj4gVGhlcmUncyBubyBzZXJpYWxpc2F0aW9u
IHdpdGggdGhlIGNvbnN1bWVyIGhlcmUuIFRoZQo+IHNoYXJlZF9wYWdlLT5kZXNjc1tdIHdpbGwg
YmUgY2xvYmJlcmVkIGJ5IGEgc2Vjb25kIGVuZ2luZSBiZWZvcmUgdGhleQo+IGFyZSByZWFkIGJ5
IHB2LiBUaGVyZSBzaG91bGQgYmUgYSB3YWl0LWZvci1hY2sgaGVyZSwgb3Igc2VwYXJhdGUKPiBj
aGFubmVscyBmb3IgZWFjaCBlbmdpbmUuIEluIGV4ZWNsaXN0cywgd2UgYXZvaWQgdGhpcyBieSBu
b3QgZGVxdWV1aW5nCj4gdW50aWwgYWZ0ZXIgd2UgZ2V0IGEgcmVzcG9uc2UvYWNrIGZyb20gSFcu
Cj4KPiBQcmVlbXB0aW9uPyBJIGd1ZXNzIHByZWVtcHRpb24gd2FzIHR1cm5lZCBvZmYsIG9yIGVs
c2UgeW91IGhhdmUgdG8gd29ycnkKPiBhYm91dCB0aGUgc2FtZSBlbmdpbmUgb3ZlcndyaXRpbmcg
dGhlIGRlc2NbXSAoaWYgbm8gYWNrKS4KPiAtQ2hyaXMKPgpDaHJpcywgdGhhbmtzIHlvdSB0byBw
b2ludCBpdCBvdXQgbXkgZmxhdyBoZXJlLiB3aWxsIHVzZSB0aGUgcGVyLWVuZ2luZQpjaGFubmVs
IGZvciBub3RpZmljYXRpb24uICBwcmVlbXB0aW9uIGlzIHR1cm5lZCBvZmYgYW5kIG5vIHN1cHBv
cnQgaW4KY3VycmVudCB2ZXJzaW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
