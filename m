Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7550882ywo;
        Thu, 11 Apr 2019 18:44:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqJNml0eAN+e6PuanLhj4B3hc4Ol/stz4IriMmT9z8ah1/Cn7iLGD3E+C0/WShciOk6UD3
X-Received: by 2002:a17:902:b706:: with SMTP id d6mr53829027pls.250.1555033458024;
        Thu, 11 Apr 2019 18:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555033458; cv=none;
        d=google.com; s=arc-20160816;
        b=WYnFWOtJczZ5FJwPG81tsbJVqjltFbUVTj4L/OBvUmNEuaqMhgFE2GQco4nPN9i+ll
         swXESVSEIeyRMwNScTkb3C08kVfGWpt5mZmDpS4dOLqIdNg+Ba5mzrXk8NjQ4F0XqZgN
         CDRQEzmaw5uJyseEAk7EsYE74aKbdrFz92BT6YOJeclqpKOfnPPOEd6eLke2XuR/g8TW
         0eIiJ7WX6TjRMaBqu0C0HSkaEIm4xycHtuO0H+3U5ncIdnEDzLkyNEOqeIcHh6feyjnN
         ldFk+nIXZsX4/n5aQvG/2xZehmc7H+Rz3WKRZYAGiqHLY8rwmTynZcyk9NE3I9N7Ln4e
         pe0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=VF4qF+ktaIGI1hn/xoEPBXzpgaQ6eo4k6NsGFMmQP7A=;
        b=boD8lzqgwch2vzI+57cZMuJHoDPk8PsptdGB/F5uHI3brPdngj2aFSJf3q9MrGV9yC
         HMQfgo6qww8SiYnZrECVS2y4Sa0Ixz+I3FExVhVCU+lkM7TUKo/aeF/fN7JGT9HVndvI
         aZt/MGyfEmkIC24IFhZtLvkJiR8+ZTvOoze37tQe755/PMCPWym47Od7xh1O77EepVNV
         Xl85LBz4K6V0jkqnVAvkB9WNP2d2iF/nRT/9YQH/qD/MFfBkl5f7/Q7vPwjKBUEKbwrd
         5aEkIC/1MKDLOpagwTf4T6BrNaC+hOqT5DytKA88+7aTuI5QBSvriJ4+23Y+seoNYbPU
         9B/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j34si35000632pgb.64.2019.04.11.18.44.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 18:44:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614788F78;
	Fri, 12 Apr 2019 01:44:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31F88862C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 01:44:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 18:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; d="scan'208";a="148563321"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2019 18:44:14 -0700
Subject: Re: [PATCH V2 5/6] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-6-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <e50c8a38-8ab6-f3f8-8717-87d0be6587e0@intel.com>
Date: Fri, 12 Apr 2019 09:44:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411104631.7627-6-aleksei.gimbitskii@intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMTEgMTg6NDYsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBUaGUga2xv
Y3dvcmsgc3RhdGljIGNvZGUgYW5hbHl6ZXIgY29tcGxhaW5zIGFib3V0IHVzaW5nIHBvaW50ZXIg
YWZ0ZXIKPiBiZWluZyBmcmVlZCwgYmVjYXVzZSBmdXJ0aGVyIHdlIHBhc3MgaXQgdG8gdGhlIGd2
dF92Z3B1X2VycigpIGZ1bmN0aW9uLgo+IEFzc2lnbiBwb2ludGVyIHRvIGJlIE5VTEwgaW50ZW50
aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUgY29kZQo+IGFuYWx5emVyLgo+Cj4g
VGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgIzY0OCByZXBvcnRlZCBhcyBlcnJvciBieSBrbG9j
d29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0c2tpaSA8YWxla3NlaS5naW1i
aXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwu
Y29tPgo+IENjOiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+IGluZGV4IGU0NGRkYjMyOGI0Yi4u
OTVjZDhmMjVkNmY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+IEBAIC0xMTAwLDYgKzEx
MDAsNyBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9wb3B1bGF0
ZV9zcHRfYnlfZ3Vlc3RfZW50cnkoCj4gICAKPiAgIGVycl9mcmVlX3NwdDoKPiAgIAlwcGd0dF9m
cmVlX3NwdChzcHQpOwo+ICsJc3B0ID0gTlVMTDsKClNlZW1zIHYyIGlzIHNhbWUgYXMgdjE/CgpT
ZXQgc3RwIHRvIE5VTEwgY291bGQgZ3VhcmFudGVlIHRoZSBzdWNjZWVkaW5nIGd2dF92Z3B1X2Vy
ciB3b24ndCBhY2Nlc3MgaXQgYWZ0ZXIgZnJlZWQuCkhvd2V2ZXIgeW91IHdvbid0IGtub3cgd2hp
Y2ggc3B0IGZhaWxzIGF0IGVuYWJsZV9wYWdlX3RyYWNrKCkgb3IgcHBndHRfcG9wdWxhdGVfc3B0
KCkuCllvdSBjb3VsZCBhZGQgYW5vdGhlciBndnRfdmdwdV9lcnIgYmVmb3JlIHRoaXMgcHBndHRf
ZnJlZV9zcHQoKSwgYW5kIHJldHVybiBhZnRlciBzcHQKc2V0IHRvIE5VTEwuIEJ5IGRvaW5nIHRo
aXMgdGhlIHNwdCBmYWlsIGxvZyBjb3VsZCBiZSBtb3JlIGhlbHBmdWwgaW4gY2FzZSBvZiBlcnJf
ZnJlZV9zcHQuCgo+ICAgZXJyOgo+ICAgCWd2dF92Z3B1X2VycigiZmFpbDogc2hhZG93IHBhZ2Ug
JXAgZ3Vlc3QgZW50cnkgMHglbGx4IHR5cGUgJWRcbiIsCj4gICAJCSAgICAgc3B0LCB3ZS0+dmFs
NjQsIHdlLT50eXBlKTsKCi0tIApCZXN0IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
