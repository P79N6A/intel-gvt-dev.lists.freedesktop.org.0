Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp332592ywo;
        Wed, 24 Apr 2019 02:10:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZYWXAxYiv9Wzy5kWUecipPZINPrajEwo+hwhv0ZDOOVidKRCqvbTiajsc5WwIjmB85dEe
X-Received: by 2002:aa7:8609:: with SMTP id p9mr32210159pfn.166.1556097050653;
        Wed, 24 Apr 2019 02:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556097050; cv=none;
        d=google.com; s=arc-20160816;
        b=RuIRWWfLK4fl0U13TBCTcmWI5WdCzQTIJaD2Jj03eWuKGHa5jkUZGL/h80eOCa4DRD
         W6n8Gj+EG1qHNhcW+dQ5lWJhiv9VbODdxs2+x3dS1flpy8ix5x+fxTFXeO0GOcyR4XVP
         aAitWq6HLWwmBaP/rAruqhhrpb3lpVYoc1d2VRu7EO1vQUtc3ylyeoBxd4OLM9oHNsmW
         TIDMHvFk730tG9b0fJz/tqzy/NTCjj4CLUvuCTvjovGkQV16pN0MbbOhHF0WSRNleGmd
         byqmfopGUoIZUydVhd+ER2BK+MVIBHmmOBTmKTW10NLWEz4bp5j72eYN3yyjWT/PK4IL
         eXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:to:references:message-id:date:in-reply-to:from:subject
         :mime-version:delivered-to;
        bh=YLwYeHPBV3ALNunW8E6a612s36ERBUCt1xjiG4JogHc=;
        b=il6xa26hZkm1o+qprv1e0/13rurScZX+xtNomO4olBZqMDD4a1luMfGFJ4SOq5f6ta
         Ub4JvnFv14ZDekJ85QHNkS2b86kGRIB+Bevh7Nq+OQK5U+AgEF/qN+t2dn04AIpZd7Mq
         dFQQViAj7lx1dE994wYhxqnn9sQC8xFuFDmJooM1GV5r864uWQ6vPQBDofAp38XMr0dj
         IqqJ9Z7m0ZMpOdHp0ZRSALbEomgkLKJn8QWoUGFhw+pNRkMq7aqJsYztnC7nWCgtABIg
         3qX4UGcrPEcqNcoiTWnKCZEPU5Sd/uYI2A8BWsej9TQXQmSpktLmPmQ7e3JRopP8ntIV
         V4Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n1si18997330pld.94.2019.04.24.02.10.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2019 02:10:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16E8920E;
	Wed, 24 Apr 2019 09:10:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055618920E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 09:10:48 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o25so3575662wmf.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 02:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kFJZpbHqiqZPGlOO2jWLzrr7Tq5I04oVeuKvDauVaf8=;
 b=Rg13+v3INGuJ/jHQU7imCgsF1ycdl9VN4HK4uU1q4SaFbOXaFtxTd36bc+88IEi5D4
 FBJbBYG4uzePifzKpBXdiIdfe/Qou6KbVsgiTsZIZ6501blhehxsbLz7cLr0oP4KBrwk
 Tw8oDUXBSyFD0SZgggk3xQj+OfPS0IbTVKhIROX1+qlwws3lp9itxvwayVGkN3A7nSma
 WxPihO6e7xIajTkoeoUEbzZEEnU7PMIom/ncsxNBZ0S7RwVLuR+Iw1SDs+zjck7MURNr
 q+O4DW4vsjbh1mxQSKQbLeEtzf3ZbX+3GfU+n1Jw9RI8LEinOVT6hx/TRUuDWQUNvFk3
 hdoA==
X-Gm-Message-State: APjAAAU5QC+/UNiRE1fQ9SkrlIC0cph3mnREUGCRjKz0lYfmyACrwWcQ
 TJLaM+V8J+Yu1Ye6FZILCUg0yQ==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr5380745wmb.23.1556097046506; 
 Wed, 24 Apr 2019 02:10:46 -0700 (PDT)
Received: from [192.168.77.22] (val06-1-88-182-161-34.fbx.proxad.net.
 [88.182.161.34])
 by smtp.gmail.com with ESMTPSA id z7sm14042685wml.40.2019.04.24.02.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Apr 2019 02:10:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
From: Christophe de Dinechin <dinechin@redhat.com>
In-Reply-To: <20190423103939.GF6022@redhat.com>
Date: Wed, 24 Apr 2019 11:10:43 +0200
Message-Id: <3E673A9E-90B1-4A2F-AAAE-E76174AF1B6D@redhat.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423103939.GF6022@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3445.104.8)
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
Cc: cjia@nvidia.com, KVM list <kvm@vger.kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Zhengxiao.zx@alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 Erik Skultety <eskultet@redhat.com>, ziye.yang@intel.com, mlevitsk@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>, libvir-list@redhat.com,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, felipe@nutanix.com,
 Ken.Xue@amd.com, "Tian, Kevin" <kevin.tian@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 Cornelia Huck <cohuck@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 Zhi Wang <zhi.a.wang@intel.com>, jonathan.davies@nutanix.com,
 shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IE9uIDIzIEFwciAyMDE5LCBhdCAxMjozOSwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFu
Z2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gT24gRnJpLCBBcHIgMTksIDIwMTkgYXQgMDQ6MzU6
MDRBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6Cj4+IGRldmljZSB2ZXJzaW9uIGF0dHJpYnV0ZSBp
biBtZGV2IHN5c2ZzIGlzIHVzZWQgYnkgdXNlciBzcGFjZSBzb2Z0d2FyZQo+PiAoZS5nLiBsaWJ2
aXJ0KSB0byBxdWVyeSBkZXZpY2UgY29tcGF0aWJpbGl0eSBmb3IgbGl2ZSBtaWdyYXRpb24gb2Yg
VkZJTwo+PiBtZGV2IGRldmljZXMuIFRoaXMgYXR0cmlidXRlIGlzIG1hbmRhdG9yeSBpZiBhIG1k
ZXYgZGV2aWNlIHN1cHBvcnRzIGxpdmUKPj4gbWlncmF0aW9uLgo+PiAKPj4gSXQgY29uc2lzdHMg
b2YgdHdvIHBhcnRzOiBjb21tb24gcGFydCBhbmQgdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQuCj4+
IGNvbW1vbiBwYXJ0OiAzMiBiaXQuIGxvd2VyIDE2IGJpdHMgaXMgdmVuZG9yIGlkIGFuZCBoaWdo
ZXIgMTYgYml0cwo+PiAgICAgICAgICAgICBpZGVudGlmaWVzIGRldmljZSB0eXBlLiBlLmcuLCBm
b3IgcGNpIGRldmljZSwgaXQgaXMKPj4gICAgICAgICAgICAgInBjaSB2ZW5kb3IgaWQiIHwgKFZG
SU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNikuCj4+IHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0OiB0
aGlzIHBhcnQgaXMgdmFyaWVkIGluIGxlbmd0aC4gdmVuZG9yIGRyaXZlciBjYW4KPj4gICAgICAg
ICAgICAgc3BlY2lmeSBhbnkgc3RyaW5nIHRvIGlkZW50aWZ5IGEgZGV2aWNlLgo+PiAKPj4gV2hl
biByZWFkaW5nIHRoaXMgYXR0cmlidXRlLCBpdCBzaG91bGQgc2hvdyBkZXZpY2UgdmVyc2lvbiBz
dHJpbmcgb2YgdGhlCj4+IGRldmljZSBvZiB0eXBlIDx0eXBlLWlkPi4gSWYgYSBkZXZpY2UgZG9l
cyBub3Qgc3VwcG9ydCBsaXZlIG1pZ3JhdGlvbiwgaXQKPj4gc2hvdWxkIHJldHVybiBlcnJuby4K
Pj4gV2hlbiB3cml0aW5nIGEgc3RyaW5nIHRvIHRoaXMgYXR0cmlidXRlLCBpdCByZXR1cm5zIGVy
cm5vIGZvcgo+PiBpbmNvbXBhdGliaWxpdHkgb3IgcmV0dXJucyB3cml0dGVuIHN0cmluZyBsZW5n
dGggaW4gY29tcGF0aWJpbGl0eSBjYXNlLgo+PiBJZiBhIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0
IGxpdmUgbWlncmF0aW9uLCBpdCBhbHdheXMgcmV0dXJucyBlcnJuby4KPj4gCj4+IEZvciB1c2Vy
IHNwYWNlIHNvZnR3YXJlIHRvIHVzZToKPj4gMS4KPj4gQmVmb3JlIHN0YXJ0aW5nIGxpdmUgbWln
cmF0aW9uLCB1c2VyIHNwYWNlIHNvZnR3YXJlIGZpcnN0IHJlYWRzIHNvdXJjZSBzaWRlCj4+IG1k
ZXYgZGV2aWNlJ3MgdmVyc2lvbi4gZS5nLgo+PiAiI2NhdCBcCj4+IC9zeXMvYnVzL3BjaS9kZXZp
Y2VzLzAwMDBcOjAwXDowMi4wLzVhYzFmYjIwLTJiYmYtNDg0Mi1iYjdlLTM2YzU4YzNiZTljZC9t
ZGV2X3R5cGUvdmVyc2lvbiIKPj4gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVfNAo+PiAKPj4g
Mi4KPj4gVGhlbiwgdXNlciBzcGFjZSBzb2Z0d2FyZSB3cml0ZXMgdGhlIHNvdXJjZSBzaWRlIHJl
dHVybmVkIHZlcnNpb24gc3RyaW5nCj4+IHRvIGRldmljZSB2ZXJzaW9uIGF0dHJpYnV0ZSBpbiB0
YXJnZXQgc2lkZSwgYW5kIGNoZWNrcyB0aGUgcmV0dXJuIHZhbHVlLgo+PiBJZiBhIG5lZ2F0aXZl
IGVycm5vIGlzIHJldHVybmVkIGluIHRoZSB0YXJnZXQgc2lkZSwgdGhlbiBtZGV2IGRldmljZXMg
aW4KPj4gc291cmNlIGFuZCB0YXJnZXQgc2lkZXMgYXJlIG5vdCBjb21wYXRpYmxlOwo+PiBJZiBh
IHBvc2l0aXZlIG51bWJlciBpcyByZXR1cm5lZCBhbmQgaXQgZXF1YWxzIHRvIHRoZSBsZW5ndGgg
b2Ygd3JpdHRlbgo+PiBzdHJpbmcsIHRoZW4gdGhlIHR3byBtZGV2IGRldmljZXMgaW4gc291cmNl
IGFuZCB0YXJnZXQgc2lkZSBhcmUgY29tcGF0aWJsZS4KPj4gZS5nLgo+PiAoYSkgY29tcGF0aWJp
bGl0eSBjYXNlCj4+ICIjIGVjaG8gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVfNCA+Cj4+IC9z
eXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wLzg4MmNjNGRhLWRlZGUtMTFlNy05MTgw
LTA3OGE2MjA2M2FiMS9tZGV2X3R5cGUvdmVyc2lvbiIKPj4gCj4+IChiKSBpbmNvbXBhdGliaWxp
dHkgY2FzZQo+PiAiI2VjaG8gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVfMSA+Cj4+IC9zeXMv
YnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wLzg4MmNjNGRhLWRlZGUtMTFlNy05MTgwLTA3
OGE2MjA2M2FiMS9tZGV2X3R5cGUvdmVyc2lvbiIKPj4gLWJhc2g6IGVjaG86IHdyaXRlIGVycm9y
OiBJbnZhbGlkIGFyZ3VtZW50Cj4gCj4gV2hhdCB5b3UgaGF2ZSB3cml0dGVuIGhlcmUgc2VlbXMg
dG8gaW1wbHkgdGhhdCBlYWNoIG1kZXYgdHlwZSBpcyBhYmxlIHRvCj4gc3VwcG9ydCBtYW55IGRp
ZmZlcmVudCB2ZXJzaW9ucyBhdCB0aGUgc2FtZSB0aW1lLiBXcml0aW5nIGEgdmVyc2lvbiBpbnRv
Cj4gdGhpcyBzeXNmcyBmaWxlIHRoZW4gY2hvb3NlcyB3aGljaCBvZiB0aGUgbWFueSB2ZXJzaW9u
cyB0byBhY3R1YWxseSB1c2UuCj4gCj4gVGhpcyBpcyBnb29kIGFzIGl0IGFsbG93cyBmb3IgbGl2
ZSBtaWdyYXRpb24gYWNyb3NzIGRyaXZlciBzb2Z0d2FyZSB1cGdyYWRlcy4KPiAKPiBBIG1nbXQg
YXBwbGljYXRpb24gbWF5IHdlbGwgd2FudCB0byBrbm93IHdoYXQgdmVyc2lvbnMgYXJlIHN1cHBv
cnRlZCBmb3IgYW4KPiBtZGV2IHR5cGUgKmJlZm9yZSogc3RhcnRpbmcgYSBtaWdyYXRpb24uIEEg
bWdtdCBhcHAgY2FuIHF1ZXJ5IGFsbCB0aGUgMTAwJ3MKPiBvZiBob3N0cyBpdCBrbm93cyBhbmQg
dGh1cyBmaWd1cmUgb3V0IHdoaWNoIGFyZSB2YWxpZCB0byB1c2UgYXMgdGhlIHRhcmdldAo+IG9m
IGEgbWlncmF0aW9uLgo+IAo+IElPVywgd2Ugd2FudCB0byBhdm9pZCB0aGUgZXZlciBoaXR0aW5n
IHRoZSBpbmNvbXBhdGliaWxpdHkgY2FzZSBpbiB0aGUKPiBmaXJzdCBwbGFjZSwgYnkgb25seSBj
aG9vc2luZyB0byBtaWdyYXRlIHRvIGEgaG9zdCB0aGF0IHdlIGtub3cgaXMgZ29pbmcKPiB0byBi
ZSBjb21wYXRpYmxlLgo+IAo+IFRoaXMgd291bGQgbmVlZCBzb21lIGtpbmQgb2Ygd2F5IHRvIHJl
cG9ydCB0aGUgZnVsbCBsaXN0IG9mIHN1cHBvcnRlZAo+IHZlcnNpb25zIGFnYWluc3QgdGhlIG1k
ZXYgc3VwcG9ydGVkIHR5cGVzIG9uIHRoZSBob3N0Lgo+IAo+IAo+PiAzLiBpZiB0d28gbWRldiBk
ZXZpY2VzIGFyZSBjb21wYXRpYmxlLCB1c2VyIHNwYWNlIHNvZnR3YXJlIGNhbiBzdGFydAo+PiBs
aXZlIG1pZ3JhdGlvbiwgYW5kIHZpY2UgdmVyc2EuCj4+IAo+PiBOb3RlOiBpZiBhIG1kZXYgZGV2
aWNlIGRvZXMgbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0IGVpdGhlciBkb2VzCj4+IG5v
dCBwcm92aWRlIGEgdmVyc2lvbiBhdHRyaWJ1dGUsIG9yIGFsd2F5cyByZXR1cm5zIGVycm5vIHdo
ZW4gaXRzIHZlcnNpb24KPj4gYXR0cmlidXRlIGlzIHJlYWQvd3JpdHRlbi4KPj4gCj4+IENjOiBB
bGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+PiBDYzogRXJpayBT
a3VsdGV0eSA8ZXNrdWx0ZXRAcmVkaGF0LmNvbT4KPj4gQ2M6ICJEci4gRGF2aWQgQWxhbiBHaWxi
ZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KPj4gQ2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0By
ZWRoYXQuY29tPgo+PiBDYzogIlRpYW4sIEtldmluIiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4+
IENjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4+IENjOiAiV2FuZywg
WmhpIEEiIDx6aGkuYS53YW5nQGludGVsLmNvbT4KPj4gQ2M6IE5lbyBKaWEgPGNqaWFAbnZpZGlh
LmNvbT4KPj4gQ2M6IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KPj4gLS0tCj4+
IERvY3VtZW50YXRpb24vdmZpby1tZWRpYXRlZC1kZXZpY2UudHh0IHwgMzYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMgICAgICAgICAgICAg
fCAxNyArKysrKysrKysrKysKPj4gc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAg
ICAgfCAxNiArKysrKysrKysrKysKPj4gc2FtcGxlcy92ZmlvLW1kZXYvbXR0eS5jICAgICAgICAg
ICAgICAgfCAxNiArKysrKysrKysrKysKPj4gNCBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25z
KCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmlj
ZS50eHQgYi9Eb2N1bWVudGF0aW9uL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnR4dAo+PiBpbmRleCBj
M2Y2OWJjYWY5NmUuLmJjMjg0NzFjMDY2NyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92
ZmlvLW1lZGlhdGVkLWRldmljZS50eHQKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlh
dGVkLWRldmljZS50eHQKPj4gQEAgLTIwMiw2ICsyMDIsNyBAQCBEaXJlY3RvcmllcyBhbmQgZmls
ZXMgdW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoIFBoeXNpY2FsIERldmljZQo+PiAgIHwgICAgIHwg
ICB8LS0tIGF2YWlsYWJsZV9pbnN0YW5jZXMKPj4gICB8ICAgICB8ICAgfC0tLSBkZXZpY2VfYXBp
Cj4+ICAgfCAgICAgfCAgIHwtLS0gZGVzY3JpcHRpb24KPj4gKyAgfCAgICAgfCAgIHwtLS0gdmVy
c2lvbgo+PiAgIHwgICAgIHwgICB8LS0tIFtkZXZpY2VzXQo+PiAgIHwgICAgIHwtLS0gWzx0eXBl
LWlkPl0KPj4gICB8ICAgICB8ICAgfC0tLSBjcmVhdGUKPj4gQEAgLTIwOSw2ICsyMTAsNyBAQCBE
aXJlY3RvcmllcyBhbmQgZmlsZXMgdW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoIFBoeXNpY2FsIERl
dmljZQo+PiAgIHwgICAgIHwgICB8LS0tIGF2YWlsYWJsZV9pbnN0YW5jZXMKPj4gICB8ICAgICB8
ICAgfC0tLSBkZXZpY2VfYXBpCj4+ICAgfCAgICAgfCAgIHwtLS0gZGVzY3JpcHRpb24KPj4gKyAg
fCAgICAgfCAgIHwtLS0gdmVyc2lvbgo+PiAgIHwgICAgIHwgICB8LS0tIFtkZXZpY2VzXQo+PiAg
IHwgICAgIHwtLS0gWzx0eXBlLWlkPl0KPj4gICB8ICAgICAgICAgIHwtLS0gY3JlYXRlCj4+IEBA
IC0yMTYsNiArMjE4LDcgQEAgRGlyZWN0b3JpZXMgYW5kIGZpbGVzIHVuZGVyIHRoZSBzeXNmcyBm
b3IgRWFjaCBQaHlzaWNhbCBEZXZpY2UKPj4gICB8ICAgICAgICAgIHwtLS0gYXZhaWxhYmxlX2lu
c3RhbmNlcwo+PiAgIHwgICAgICAgICAgfC0tLSBkZXZpY2VfYXBpCj4+ICAgfCAgICAgICAgICB8
LS0tIGRlc2NyaXB0aW9uCj4+ICsgIHwgICAgICAgICAgfC0tLSB2ZXJzaW9uCj4+ICAgfCAgICAg
ICAgICB8LS0tIFtkZXZpY2VzXQo+PiAKPj4gKiBbbWRldl9zdXBwb3J0ZWRfdHlwZXNdCj4+IEBA
IC0yMjUsNiArMjI4LDggQEAgRGlyZWN0b3JpZXMgYW5kIGZpbGVzIHVuZGVyIHRoZSBzeXNmcyBm
b3IgRWFjaCBQaHlzaWNhbCBEZXZpY2UKPj4gICBbPHR5cGUtaWQ+XSwgZGV2aWNlX2FwaSwgYW5k
IGF2YWlsYWJsZV9pbnN0YW5jZXMgYXJlIG1hbmRhdG9yeSBhdHRyaWJ1dGVzCj4+ICAgdGhhdCBz
aG91bGQgYmUgcHJvdmlkZWQgYnkgdmVuZG9yIGRyaXZlci4KPj4gCj4+ICsgIHZlcnNpb24gaXMg
YSBtYW5kYXRvcnkgYXR0cmlidXRlIGlmIGEgbWRldiBkZXZpY2Ugc3VwcG9ydHMgbGl2ZSBtaWdy
YXRpb24uCj4+ICsKPj4gKiBbPHR5cGUtaWQ+XQo+PiAKPj4gICBUaGUgWzx0eXBlLWlkPl0gbmFt
ZSBpcyBjcmVhdGVkIGJ5IGFkZGluZyB0aGUgZGV2aWNlIGRyaXZlciBzdHJpbmcgYXMgYSBwcmVm
aXgKPj4gQEAgLTI0Niw2ICsyNTEsMzUgQEAgRGlyZWN0b3JpZXMgYW5kIGZpbGVzIHVuZGVyIHRo
ZSBzeXNmcyBmb3IgRWFjaCBQaHlzaWNhbCBEZXZpY2UKPj4gICBUaGlzIGF0dHJpYnV0ZSBzaG91
bGQgc2hvdyB0aGUgbnVtYmVyIG9mIGRldmljZXMgb2YgdHlwZSA8dHlwZS1pZD4gdGhhdCBjYW4g
YmUKPj4gICBjcmVhdGVkLgo+PiAKPj4gKyogdmVyc2lvbgo+PiArCj4+ICsgIFRoaXMgYXR0cmli
dXRlIGlzIHJ3LiBJdCBpcyB1c2VkIHRvIGNoZWNrIHdoZXRoZXIgdHdvIGRldmljZXMgYXJlIGNv
bXBhdGlibGUKPj4gKyAgZm9yIGxpdmUgbWlncmF0aW9uLiBJZiB0aGlzIGF0dHJpYnV0ZSBpcyBt
aXNzaW5nLCB0aGVuIHRoZSBjb3JyZXNwb25kaW5nIG1kZXYKPj4gKyAgZGV2aWNlIGlzIHJlZ2Fy
ZGVkIGFzIG5vdCBzdXBwb3J0aW5nIGxpdmUgbWlncmF0aW9uLgo+PiArCj4+ICsgIEl0IGNvbnNp
c3RzIG9mIHR3byBwYXJ0czogY29tbW9uIHBhcnQgYW5kIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0
Lgo+PiArICBjb21tb24gcGFydDogMzIgYml0LiBsb3dlciAxNiBiaXRzIGlzIHZlbmRvciBpZCBh
bmQgaGlnaGVyIDE2IGJpdHMgaWRlbnRpZmllcwo+PiArICAgICAgICAgICAgICAgZGV2aWNlIHR5
cGUuIGUuZy4sIGZvciBwY2kgZGV2aWNlLCBpdCBpcwo+PiArICAgICAgICAgICAgICAgInBjaSB2
ZW5kb3IgaWQiIHwgKFZGSU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNikuCj4+ICsgIHZlbmRvciBw
cm9wcmlldGFyeSBwYXJ0OiB0aGlzIHBhcnQgaXMgdmFyaWVkIGluIGxlbmd0aC4gdmVuZG9yIGRy
aXZlciBjYW4KPj4gKyAgICAgICAgICAgICAgIHNwZWNpZnkgYW55IHN0cmluZyB0byBpZGVudGlm
eSBhIGRldmljZS4KPj4gKwo+PiArICBXaGVuIHJlYWRpbmcgdGhpcyBhdHRyaWJ1dGUsIGl0IHNo
b3VsZCBzaG93IGRldmljZSB2ZXJzaW9uIHN0cmluZyBvZiB0aGUgZGV2aWNlCj4+ICsgIG9mIHR5
cGUgPHR5cGUtaWQ+LiBJZiBhIGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IGxpdmUgbWlncmF0aW9u
LCBpdCBzaG91bGQKPj4gKyAgcmV0dXJuIGVycm5vLgo+PiArICBXaGVuIHdyaXRpbmcgYSBzdHJp
bmcgdG8gdGhpcyBhdHRyaWJ1dGUsIGl0IHJldHVybnMgZXJybm8gZm9yIGluY29tcGF0aWJpbGl0
eQo+PiArICBvciByZXR1cm5zIHdyaXR0ZW4gc3RyaW5nIGxlbmd0aCBpbiBjb21wYXRpYmlsaXR5
IGNhc2UuIElmIGEgZGV2aWNlIGRvZXMgbm90Cj4+ICsgIHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24s
IGl0IGFsd2F5cyByZXR1cm5zIGVycm5vLgo+PiArCj4+ICsgIGZvciBleGFtcGxlLgo+PiArICAj
IGNhdCBcCj4+ICsgL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDBcOjAyLjAvbWRldl9zdXBw
b3J0ZWRfdHlwZXMvaTkxNS1HVlRnX1Y1XzIvdmVyc2lvbgo+PiArICAwMDAyODA4Ni0xOTNiLWk5
MTUtR1ZUZ19WNV8yCj4+ICsKPj4gKyAgI2VjaG8gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVf
MiA+IFwKPj4gKyAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIuMC9tZGV2X3N1cHBv
cnRlZF90eXBlcy9pOTE1LUdWVGdfVjVfNC92ZXJzaW9uCj4+ICsgLWJhc2g6IGVjaG86IHdyaXRl
IGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50Cj4+ICsKPiAKPiBJSVVDIHRoaXMgcGF0aCBpcyBhZ2Fp
bnN0IHRoZSBwaHlzaWNhbCBkZXZpY2UuIElPVywgdGhlIG1nbXQgYXBwIHdvdWxkIGhhdmUKPiB0
byBmaXJzdCB3cml0ZSB0byB0aGUgInZlcnNpb24iIGZpbGUgdG8gY2hvb3NlIGEgdmVyc2lvbiwg
YW5kIHRoZW4gd3JpdGUgdG8KPiB0aGUgImNyZWF0ZSIgZmlsZSB0byBhY3R1YWxseSBjcmVhdGUg
YW4gdmlydHVhbCBkZXZpY2UuIFRoaXMgaGFzIHRoZSBvYnZpb3VzCj4gY29uY3VycmVuY3kgcHJv
YmxlbSBpZiBtdWx0aXBsZSBkZXZpY2VzIGFyZSBiZWluZyBjcmVhdGVkIGF0IHRoZSBzYW1lIHRp
bWUKPiBhbmQgZGlzdGluY3QgdmVyc2lvbnMgZm9yIGVhY2ggZGV2aWNlIGFyZSByZXF1aXJlZC4g
VGhlcmUgd291bGQgbmVlZCB0byBiZQo+IGEgbG9ja2luZyBzY2hlbWUgZGVmaW5lZCB0byBlbnN1
cmUgc2FmZXR5Lgo+IAo+IFdvdWxkbid0IGl0IGJlIGJldHRlciBpZiB3ZSBjYW4gcGFzcyB0aGUg
ZGVzaXJlZCB2ZXJzaW9uIHdoZW4gd2Ugd3JpdGUgdG8KPiB0aGUgImNyZWF0ZSIgZmlsZSwgc28g
dGhhdCB3ZSBhdm9pZCBhbnkgY29uY3VycmVudCB1c2FnZSBwcm9ibGVtcy4gInZlcnNpb24iCj4g
Y291bGQgYmUganVzdCBhIHJlYWQtb25seSBmaWxlIHdpdGggYSAqbGlzdCogb2Ygc3VwcG9ydGVk
IHZlcnNpb25zLgo+IAo+IGVnCj4gCj4gICQgY2F0IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBc
OjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNpb24KPiAg
NS4wCj4gIDUuMQo+ICA1LjIKPiAKPiAgJCBlY2hvICI4M2I4ZjRmMi01MDlmLTM4MmYtM2MxZS1l
NmJmZTBmYTEwMDE7dmVyc2lvbj01LjIiID4KPiAgICAgIC9zeXMvZGV2aWNlcy92aXJ0dWFsL210
dHkvbXR0eS9tZGV2X3N1cHBvcnRlZF90eXBlcy9tdHR5LTIvY3JlYXRlCj4gCgpJIHJlYWQgQWxl
eOKAmXMgY29tbWVudCB0aGF0IGNyZWF0aW5nIGFuIG1kZXYgd2l0aCBhIHNwZWNpZmljIHZlcnNp
b24gaXMgbm90IHRoZSBpbnRlbnQgaGVyZS4gSG93ZXZlcuKApgoKLSBJZiB0aGUgZ29hbCBpcyBq
dXN0IHRvIGNoZWNrIGNvbXBhdGliaWxpdHkgd2l0aCBtaWdyYXRpb24gZGF0YSwgdGhlbiBJIHRo
aW5rIHRoZSBuYW1lIHNob3VsZCBiZSBtb3JlIGV4cGxpY2l0LCBlLmcuIG1pZ3JhdGlvbl92ZXJz
aW9uIGluc3RlYWQgb2YgdmVyc2lvbi4gT3RoZXJ3aXNlLCBJIHJlYWQgdGhlIGludGVudCB0aGUg
d2F5IERhbmllbCBkaWQuCgotIElmIHdlIHdhbnQgdG8gcHJvdmlkZSBhIGxpc3Qgb2YgdmVyc2lv
bnMgYW5kIG1ha2UgaXQgcG9zc2libGUgdG8gY3JlYXRlIGluc3RhbmNlcyBiYXNlZCBvbiBhIHZl
cnNpb24sIEkgd291bGQgcmF0aGVyIHVzZSBhIGRpcmVjdG9yeSBzdHJ1Y3R1cmUgZm9yIHRoYXQs
IGkuZS4gKHJlcGxhY2luZyBjYXQgd2l0aCBscyk6CgokIGxzIC9zeXMvYnVzL3BjaS9kZXZpY2Vz
LzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNp
b24KIDUuMAogNS4xCiA1LjIKCndoZXJlIGVhY2ggdmVyc2lvbiBpcyBhIGRpcmVjdG9yeSB0aGF0
IGhhcyBpdHMgb3duIGF2YWlsYWJsZV9pbnN0YW5jZXMsIGRldmljZV9hcGksIGRlc2NyaXB0aW9u
LCBjcmVhdGUsIOKApgoKJCBlY2hvIDgzYjhmNGYyLTUwOWYtMzgyZi0zYzFlLWU2YmZlMGZhMTAw
MSA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5
cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNpb24vNS4xL2NyZWF0ZQoKSW4gYWRkaXRpb24gdG8gbm90
IGhhdmluZyB0aGUgcHJvYmxlbSBvZiB0d28gY29uc2VjdXRpdmUgd3JpdGVzIHRvIGRpc3RpbmN0
IGZpbGVzLCBJIGNhbiBpbWFnaW5lIGNvbnRyaXZlZCBjYXNlcyB3aGVyZSBhdmFpbGFibGVfaW5z
dGFuY2VzIG1pZ2h0IGRlcGVuZCBvbiB0aGUgdmVyc2lvbuKApgoKClRoYW5rcwpDaHJpc3RvcGhl
Cgo+IAo+IFJlZ2FyZHMsCj4gRGFuaWVsCj4gLS0gCj4gfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20g
ICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cj4g
fDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0
b3AxMzguYmVycmFuZ2UuY29tIDp8Cj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAg
LW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
