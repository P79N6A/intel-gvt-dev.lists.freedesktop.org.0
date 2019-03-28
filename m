Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp369009ywb;
        Thu, 28 Mar 2019 02:21:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKoYcTm6OepKMLdTjPK1TqfMY3TkbF8t0ctdHfkhVk22OO2Iqjgzqm+xu2L4Cw3hWwc6j8
X-Received: by 2002:a63:6142:: with SMTP id v63mr38708412pgb.342.1553764912570;
        Thu, 28 Mar 2019 02:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553764912; cv=none;
        d=google.com; s=arc-20160816;
        b=auD2yadYuuss21vAUUFw371z2llj3gWdXAN2r3qxjYGVgc9D4p7n+Pds7IcN8UK1rY
         DXqtjMqgCyJapD1+9xYSbFrROrqK7vDir/fm7Cu6QZ2YXhXqqSeTiI+LRL1RFQeccuM5
         MZBd8YshYjmEyO0LMu7sH7T4MbELIT0Zgb+O32IPCvmMXcOg3i4A6YrDZkIV9bGPhDnQ
         psJTZDIiOTsd4JL2GzfT7FFK4ZzCxvcGNFv6kTmKOxslwyN90A0Uwx41MvSuYqboXL+O
         6bhFLYDe97tWELhtcKuaI+NdqmIAo8XEytt7YskithRSKP+vP3PlbiQxC4kjuVgdIQvx
         bPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=5AroG9PttwgmyHm0N3u7eteUrVPbPbAqqJYDzbVVIxE=;
        b=pdQWXYZhalD673f6CKkSTTwhfZTTdNUhPpfNlgz/7sXg692MwdKWlhfP87KDTUgGUQ
         HdKoP+BW2ht5J8MAJ+w5YquSeYAYUnFFDV4O6cT6PvDjeh3XjZCHKrcqaFYKBDuTA+7M
         iX0GVQh7OwD1S7wnbPntZNTp/pFP3n25IPaeoA8pDbmnuzfzbxw01ATxJ8YOJ7Gt4S7l
         3c1WT7ITESGs5XLvmQs+CcUQ3AJonu7POIOsZ/XCBKJSWS68AaoblnRcMUJjCQnqTKj+
         7Il7A0rIROxPEaO6tTl4yLGFExw1uKNxMDW6aWKAoccyCWSRRV4Nse0Z+nCyQ1TkaM9X
         lkmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 91si21664722pla.14.2019.03.28.02.21.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 02:21:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4A06E33E;
	Thu, 28 Mar 2019 09:21:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F376E34F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Mar 2019 09:21:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F9575947D;
 Thu, 28 Mar 2019 09:21:49 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8153162669;
 Thu, 28 Mar 2019 09:21:40 +0000 (UTC)
Date: Thu, 28 Mar 2019 10:21:38 +0100
From: Erik Skultety <eskultet@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190328092138.GA1989@beluga.usersys.redhat.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm> <20190327161020.1c013e65@x1.home>
 <20190328083602.GE14681@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190328083602.GE14681@joy-OptiPlex-7040>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 28 Mar 2019 09:21:49 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDQ6MzY6MDNBTSAtMDQwMCwgWmhhbyBZYW4gd3JvdGU6
Cj4gaGkgQWxleCBhbmQgRGF2ZSwKPiBUaGFua3MgZm9yIHlvdXIgcmVwbGllcy4KPiBQbGVhc2Ug
c2VlIG15IGNvbW1lbnRzIGlubGluZS4KPgo+IE9uIFRodSwgTWFyIDI4LCAyMDE5IGF0IDA2OjEw
OjIwQU0gKzA4MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+IE9uIFdlZCwgMjcgTWFyIDIw
MTkgMjA6MTg6NTQgKzAwMDAKPiA+ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiAqIFpoYW8gWWFuICh5YW4ueS56aGFvQGludGVs
LmNvbSkgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDc6NDI6NDJQTSAr
MDgwMCwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gICBiKSBIb3cgZG8g
d2UgZGV0ZWN0IGlmIHdlJ3JlIG1pZ3JhdGluZyBmcm9tL3RvIHRoZSB3cm9uZyBkZXZpY2Ugb3IK
PiA+ID4gPiA+ID4gPiA+ID4gdmVyc2lvbiBvZiBkZXZpY2U/ICBPciBzYXkgdG8gYSBkZXZpY2Ug
d2l0aCBvbGRlciBmaXJtd2FyZSBvciBwZXJoYXBzCj4gPiA+ID4gPiA+ID4gPiA+IGEgZGV2aWNl
IHRoYXQgaGFzIGxlc3MgZGV2aWNlIG1lbW9yeSA/Cj4gPiA+ID4gPiA+ID4gPiBBY3R1YWxseSBp
dCdzIHN0aWxsIGFuIG9wZW4gZm9yIFZGSU8gbWlncmF0aW9uLiBOZWVkIHRvIHRoaW5rIGFib3V0
Cj4gPiA+ID4gPiA+ID4gPiB3aGV0aGVyIGl0J3MgYmV0dGVyIHRvIGNoZWNrIHRoYXQgaW4gbGli
dmlydCBvciBxZW11IChsaWtlIGEgZGV2aWNlIG1hZ2ljCj4gPiA+ID4gPiA+ID4gPiBhbG9uZyB3
aXRoIHZlcmlvbiA/KS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2UgbXVzdCBrZWVwIHRoZSBo
YXJkd2FyZSBnZW5lcmF0aW9uIGlzIHRoZSBzYW1lIHdpdGggb25lIFBPRCBvZiBwdWJsaWMgY2xv
dWQKPiA+ID4gPiA+ID4gcHJvdmlkZXJzLiBCdXQgd2Ugc3RpbGwgdGhpbmsgYWJvdXQgdGhlIGxp
dmUgbWlncmF0aW9uIGJldHdlZW4gZnJvbSB0aGUgdGhlIGxvd2VyCj4gPiA+ID4gPiA+IGdlbmVy
YXRpb24gb2YgaGFyZHdhcmUgbWlncmF0ZWQgdG8gdGhlIGhpZ2hlciBnZW5lcmF0aW9uLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEFncmVlZCwgbG93ZXItPmhpZ2hlciBpcyB0aGUgb25lIGRpcmVjdGlv
biB0aGF0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8KPiA+ID4gPiA+IHN1cHBvcnQuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gQnV0IHJlZ2FyZGxlc3Mgb2YgdGhhdCwgSSB0aGluayB3ZSBuZWVkIHRvIG1ha2Ug
c3VyZSB0aGF0IGluY29tcGF0aWJsZQo+ID4gPiA+ID4gZGV2aWNlcy92ZXJzaW9ucyBmYWlsIGRp
cmVjdGx5IGluc3RlYWQgb2YgZmFpbGluZyBpbiBhIHN1YnRsZSwgaGFyZCB0bwo+ID4gPiA+ID4g
ZGVidWcgd2F5LiBNaWdodCBiZSB1c2VmdWwgdG8gZG8gc29tZSBpbml0aWFsIHNhbml0eSBjaGVj
a3MgaW4gbGlidmlydAo+ID4gPiA+ID4gYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3cg
ZWFzeSBpcyBpdCB0byBvYnRhaW4gdGhhdCBpbmZvcm1hdGlvbiBpbiBhIGZvcm0gdGhhdCBjYW4g
YmUKPiA+ID4gPiA+IGNvbnN1bWVkIGJ5IGhpZ2hlciBsYXllcnM/IENhbiB3ZSBmaW5kIG91dCB0
aGUgZGV2aWNlIHR5cGUgYXQgbGVhc3Q/Cj4gPiA+ID4gPiBXaGF0IGFib3V0IHNvbWUga2luZCBv
ZiByZXZpc2lvbj8KPiA+ID4gPiBoaSBBbGV4IGFuZCBDb3JuZWxpYQo+ID4gPiA+IGZvciBkZXZp
Y2UgY29tcGF0aWJpbGl0eSwgZG8geW91IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEgdG8gdXNlICJ2
ZXJzaW9uIgo+ID4gPiA+IGFuZCAiZGV2aWNlIHZlcnNpb24iIGZpZWxkcz8KPiA+ID4gPgo+ID4g
PiA+IHZlcnNpb24gZmllbGQ6IGlkZW50aWZ5IGxpdmUgbWlncmF0aW9uIGludGVyZmFjZSdzIHZl
cnNpb24uIGl0IGNhbiBoYXZlIGEKPiA+ID4gPiBzb3J0IG9mIGJhY2t3YXJkIGNvbXBhdGliaWxp
dHksIGxpa2UgdGFyZ2V0IG1hY2hpbmUncyB2ZXJzaW9uID49IHNvdXJjZQo+ID4gPiA+IG1hY2hp
bmUncyB2ZXJzaW9uLiBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ID4KPiA+IERvbid0IHdlIGVzc2Vu
dGlhbGx5IGFscmVhZHkgaGF2ZSB0aGlzIHZpYSB0aGUgZGV2aWNlIHNwZWNpZmljIHJlZ2lvbj8K
PiA+IFRoZSBzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaW5jbHVkZXMgaWQgYW5kIHZlcnNp
b24gZmllbGRzLCBzbyB3ZQo+ID4gY2FuIGRlY2xhcmUgYSBtaWdyYXRpb24gaWQgYW5kIGluY3Jl
bWVudCB0aGUgdmVyc2lvbiBmb3IgYW55Cj4gPiBpbmNvbXBhdGlibGUgY2hhbmdlcyB0byB0aGUg
cHJvdG9jb2wuCj4geWVzLCBnb29kIGlkZWEhCj4gc28sIHdoYXQgYWJvdXQgZGVjbGFyaW5nIGJl
bG93IG5ldyBjYXA/Cj4gICAgICNkZWZpbmUgVkZJT19SRUdJT05fSU5GT19DQVBfTUlHUkFUSU9O
IDQKPiAgICAgc3RydWN0IHZmaW9fcmVnaW9uX2luZm9fY2FwX21pZ3JhdGlvbiB7Cj4gICAgICAg
ICBzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaGVhZGVyOwo+ICAgICAgICAgX191MzIgZGV2
aWNlX3ZlcnNpb25fbGVuOwo+ICAgICAgICAgX191OCAgZGV2aWNlX3ZlcnNpb25bXTsKPiAgICAg
fTsKPgo+Cj4gPiA+ID4KPiA+ID4gPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28g
cGFydHM6Cj4gPiA+ID4gMS4gdmVuZG9yIGlkIDogaXQgdGFrZXMgMzIgYml0cy4gZS5nLiAweDgw
ODYuCj4gPgo+ID4gV2hvIGFsbG9jYXRlcyBJRHM/ICBJZiB3ZSdyZSBnb2luZyB0byB1c2UgUENJ
IHZlbmRvciBJRHMsIHRoZW4gSSdkCj4gPiBzdWdnZXN0IHdlIHVzZSBhIGJpdCB0byBmbGFnIGl0
IGFzIHN1Y2ggc28gd2UgY2FuIHJlc2VydmUgdGhhdCBwb3J0aW9uCj4gPiBvZiB0aGUgMzJiaXQg
YWRkcmVzcyBzcGFjZS4gIFNlZSBmb3IgZXhhbXBsZToKPiA+Cj4gPiAjZGVmaW5lIFZGSU9fUkVH
SU9OX1RZUEVfUENJX1ZFTkRPUl9UWVBFICAgICAgICAoMSA8PCAzMSkKPiA+ICNkZWZpbmUgVkZJ
T19SRUdJT05fVFlQRV9QQ0lfVkVORE9SX01BU0sgICAgICAgICgweGZmZmYpCj4gPgo+ID4gRm9y
IHZlbmRvciBzcGVjaWZpYyByZWdpb25zLgo+IFllcywgdXNlIFBDSSB2ZW5kb3IgSUQuCj4geW91
IGFyZSByaWdodCwgd2UgbmVlZCB0byB1c2UgaGlnaGVzdCBiaXQgKFZGSU9fUkVHSU9OX1RZUEVf
UENJX1ZFTkRPUl9UWVBFKQo+IHRvIGlkZW50aWZ5IGl0J3MgYSBQQ0kgSUQuCj4gVGhhbmtzIGZv
ciBwb2ludGluZyBpdCBvdXQuCj4gQnV0LCBJIGhhdmUgYSBxdWVzdGlvbi4gd2hhdCBpcyBWRklP
X1JFR0lPTl9UWVBFX1BDSV9WRU5ET1JfTUFTSyB1c2VkIGZvcj8KPiB3aHkgaXQncyAweGZmZmY/
IEkgc2VhcmNoZWQgUUVNVSBhbmQga2VybmVsIGNvZGUgYW5kIGRpZCBub3QgZmluZCBhbnl3aGVy
ZQo+IHVzZXMgaXQuCj4KPgo+ID4gPiA+IDIuIHZlbmRvciBwcm9wcmlldGFyeSBzdHJpbmc6IGl0
IGNhbiBiZSBhbnkgc3RyaW5nIHRoYXQgYSB2ZW5kb3IgZHJpdmVyCj4gPiA+ID4gdGhpbmtzIGNh
biBpZGVudGlmeSBhIHNvdXJjZSBkZXZpY2UuIGUuZy4gcGNpaWQgKyBtZGV2IHR5cGUuCj4gPiA+
ID4gInZlbmRvciBpZCIgaXMgdG8gYXZvaWQgb3ZlcmxhcCBvZiAidmVuZG9yIHByb3ByaWV0YXJ5
IHN0cmluZyIuCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IHN0cnVjdCB2ZmlvX2RldmljZV9zdGF0
ZV9jdGwgewo+ID4gPiA+ICAgICAgX191MzIgdmVyc2lvbjsgICAgICAgICAgICAvKiBybyAqLwo+
ID4gPiA+ICAgICAgX191OCBkZXZpY2VfdmVyc2lvbltNQVhfREVWSUNFX1ZFUlNJT05fTEVOXTsg
ICAgICAgICAgICAvKiBybyAqLwo+ID4gPiA+ICAgICAgc3RydWN0IHsKPiA+ID4gPiAgICAgIAlf
X3UzMiBhY3Rpb247IC8qIEdFVF9CVUZGRVIsIFNFVF9CVUZGRVIsIElTX0NPTVBBVElCTEUqLwo+
ID4gPiA+IAkuLi4KPiA+ID4gPiAgICAgIH1kYXRhOwo+ID4gPiA+ICAgICAgLi4uCj4gPiA+ID4g
IH07Cj4gPgo+ID4gV2UgaGF2ZSBhIGJ1ZmZlciBhcmVhIHdoZXJlIHdlIGNhbiByZWFkIGFuZCB3
cml0ZSBkYXRhIGZyb20gdGhlIHZlbmRvcgo+ID4gZHJpdmVyLCB3aHkgd291bGQgd2UgaGF2ZSB0
aGlzIElTX0NPTVBBVElCTEUgcHJvdG9jb2wgdG8gd3JpdGUgdGhlCj4gPiBkZXZpY2UgdmVyc2lv
biBzdHJpbmcgYnV0IHVzZSBhIHN0YXRpYyBmaXhlZCBsZW5ndGggdmVyc2lvbiBzdHJpbmcgaW4K
PiA+IHRoZSBjb250cm9sIGhlYWRlciB0byByZWFkIGl0PyAgSU9XLCBsZXQncyB1c2UgR0VUX1ZF
UlNJT04sCj4gPiBDSEVDS19WRVJTSU9OIGFjdGlvbnMgdGhhdCBtYWtlIHVzZSBvZiB0aGUgYnVm
ZmVyIGFyZWEgYW5kIGFsbG93IHZlbmRvcgo+ID4gc3BlY2lmaWMgdmVyc2lvbiBpbmZvcm1hdGlv
biBsZW5ndGguCj4geW91IGFyZSByaWdodCwgc3VjaCBzdGF0aWMgZml4ZWQgbGVuZ3RoIHZlcnNp
b24gc3RyaW5nIGlzIGJhZCA6KQo+IFRvIGdldCBkZXZpY2UgdmVyc2lvbiwgZG8geW91IHRoaW5r
IHdoaWNoIGFwcHJvYWNoIGJlbG93IGlzIGJldHRlcj8KPiAxLiB1c2UgR0VUX1ZFUlNJT04gYWN0
aW9uLCBhbmQgcmVhZCBmcm9tIHJlZ2lvbiBidWZmZXIKPiAyLiBnZXQgaXQgd2hlbiBxdWVyeWlu
ZyBjYXAgVkZJT19SRUdJT05fSU5GT19DQVBfTUlHUkFUSU9OCj4KPiBzZWVtcyBhcHByb2FjaCAx
IGlzIGJldHRlciwgYW5kIGNhcCBWRklPX1JFR0lPTl9JTkZPX0NBUF9NSUdSQVRJT04gaXMgb25s
eQo+IGZvciBjaGVja2luZyBtaWdyYXRpb24gaW50ZXJmYWNlJ3MgdmVyc2lvbj8KPgo+ID4gPiA+
Cj4gPiA+ID4gVGhlbiwgYW4gYWN0aW9uIElTX0NPTVBBVElCTEUgaXMgYWRkZWQgdG8gY2hlY2sg
ZGV2aWNlIGNvbXBhdGliaWxpdHkuCj4gPiA+ID4KPiA+ID4gPiBUaGUgZmxvdyB0byBmaWd1cmUg
b3V0IHdoZXRoZXIgYSBzb3VyY2UgZGV2aWNlIGlzIG1pZ3JhdGFibGUgdG8gdGFyZ2V0IGRldmlj
ZQo+ID4gPiA+IGlzIGxpa2UgdGhhdDoKPiA+ID4gPiAxLiBpbiBzb3VyY2Ugc2lkZSdzIC5zYXZl
X3NldHVwLCBzYXZlIHNvdXJjZSBkZXZpY2UncyBkZXZpY2VfdmVyc2lvbiBzdHJpbmcKPiA+ID4g
PiAyLiBpbiB0YXJnZXQgc2lkZSdzIC5sb2FkX3N0YXRlLCBsb2FkIHNvdXJjZSBkZXZpY2UncyBk
ZXZpY2UgdmVyc2lvbiBzdHJpbmcKPiA+ID4gPiBhbmQgd3JpdGUgaXQgdG8gZGF0YSByZWdpb24s
IGFuZCBjYWxsIElTX0NPTVBBVElCTEUgYWN0aW9uIHRvIGFzayB2ZW5kb3IgZHJpdmVyCj4gPiA+
ID4gdG8gY2hlY2sgd2hldGhlciB0aGUgc291cmNlIGRldmljZSBpcyBjb21wYXRpYmxlIHRvIGl0
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGFkdmFudGFnZSBvZiBhZGRpbmcgYW4gSVNfQ09NUEFUSUJM
RSBhY3Rpb24gaXMgdGhhdCwgdmVuZG9yIGRyaXZlciBjYW4KPiA+ID4gPiBtYWludGFpbiBhIGNv
bXBhdGliaWxpdHkgdGFibGUgYW5kIGRlY2lkZSB3aGV0aGVyIHNvdXJjZSBkZXZpY2UgaXMgY29t
cGF0aWJsZQo+ID4gPiA+IHRvIHRhcmdldCBkZXZpY2UgYWNjb3JkaW5nIHRvIGl0cyBwcm9wcmll
dGFyeSB0YWJsZS4KPiA+ID4gPiBJbiBkZXZpY2VfdmVyc2lvbiBzdHJpbmcsIHZlbmRvciBkcml2
ZXIgb25seSBoYXMgdG8gZGVzY3JpYmUgdGhlIHNvdXJjZQo+ID4gPiA+IGRldmljZSBhcyBlbGFi
b3JhdGVseSBhcyBwb3NzaWJsZSBhbmQgcmVzb3J0cyB0byB2ZW5kb3IgZHJpdmVyIGluIHRhcmdl
dCBzaWRlCj4gPiA+ID4gdG8gZmlndXJlIG91dCB3aGV0aGVyIHRoZXkgYXJlIGNvbXBhdGlibGUu
Cj4gPgo+ID4gSSBhZ3JlZSwgaXQncyB0b28gY29tcGxpY2F0ZWQgYW5kIHJlc3RyaWN0aXZlIHRv
IHRyeSB0byBjcmVhdGUgYW4KPiA+IGludGVyZmFjZSBmb3IgdGhlIHVzZXIgdG8gZGV0ZXJtaW5l
IGNvbXBhdGliaWxpdHksIGxldCB0aGUgZHJpdmVyCj4gPiBkZWNsYXJlIGl0IGNvbXBhdGlibGUg
b3Igbm90Lgo+IDopCj4KPiA+ID4gSXQgd291bGQgYWxzbyBiZSBnb29kIGlmIHRoZSAnSVNfQ09N
UEFUSUJMRScgd2FzIHNvbWVob3cgY2FsbGFibGUKPiA+ID4gZXh0ZXJuYWxseSAtIHNvIHdlIGNv
dWxkIGJlIGFibGUgdG8gYW5zd2VyIGEgcXVlc3Rpb24gbGlrZSAnY2FuIHdlCj4gPiA+IG1pZ3Jh
dGUgdGhpcyBWTSB0byB0aGlzIGhvc3QnIC0gZnJvbSB0aGUgbWFuYWdlbWVudCBsYXllciBiZWZv
cmUgaXQKPiA+ID4gYWN0dWFsbHkgc3RhcnRzIHRoZSBtaWdyYXRpb24uCj4KPiBzbyBxZW11IG5l
ZWRzIHRvIGV4cG9zZSB0d28gcW1wL3N5c2ZzIGludGVyZmFjZXM6IEdFVF9WRVJTSU9OIGFuZCBD
SEVDS19WRVJTSU9OLgo+IEdFVF9WRVJTSU9OIHJldHVybnMgYSB2bSdzIGRldmljZSdzIHZlcnNp
b24gc3RyaW5nLgo+IENIRUNLX1ZFUlNJT04ncyBpbnB1dCBpcyBkZXZpY2UgdmVyc2lvbiBzdHJp
bmcgYW5kIHJldHVybgo+IGNvbXBhdGlibGUvbm9uLWNvbXBhdGlibGUuCj4gRG8geW91IHRoaW5r
IGl0J3MgZ29vZD8KPgo+ID4gSSB0aGluayB3ZSdkIG5lZWQgdG8gbWlycm9yIHRoaXMgY2FwYWJp
bGl0eSBpbiBzeXNmcyB0byBzdXBwb3J0IHRoYXQsCj4gPiBvciBjcmVhdGUgYSBxbXAgaW50ZXJm
YWNlIHRocm91Z2ggUUVNVSB0aGF0IHRoZSBkZXZpY2Ugb3duZXIgY291bGQgbWFrZQo+ID4gdGhl
IHJlcXVlc3Qgb24gYmVoYWxmIG9mIHRoZSBtYW5hZ2VtZW50IGxheWVyLiAgR2V0dGluZyBhY2Nl
c3MgdG8gdGhlCj4gPiB2ZmlvIGRldmljZSByZXF1aXJlcyBhbiBpb21tdSBjb250ZXh0IHRoYXQn
cyBhbHJlYWR5IGluIHVzZSBieSB0aGUKPiA+IGRldmljZSBvd25lciwgd2UgaGF2ZSBubyBpbnRl
bnRpb24gb2Ygc3VwcG9ydGluZyBhIG1vZGVsIHRoYXQgYWxsb3dzCj4gPiBpbmRlcGVuZGVudCB0
YXNrcyBhY2Nlc3MgdG8gYSBkZXZpY2UuICBUaGFua3MsCj4gPiBBbGV4Cj4gPgo+IGRvIHlvdSB0
aGluayB0d28gc3lzZnMgbm9kZXMgdW5kZXIgYSBkZXZpY2Ugbm9kZSBpcyBvaz8KPiBlLmcuCj4g
L3N5cy9kZXZpY2VzL3BjaTAwMDBcOjAwLzAwMDBcOjAwXDowMi4wLzg4MmNjNGRhLWRlZGUtMTFl
Ny05MTgwLTA3OGE2MjA2M2FiMS9nZXRfdmVyc2lvbgo+IC9zeXMvZGV2aWNlcy9wY2kwMDAwXDow
MC8wMDAwXDowMFw6MDIuMC84ODJjYzRkYS1kZWRlLTExZTctOTE4MC0wNzhhNjIwNjNhYjEvY2hl
Y2tfdmVyc2lvbgoKV2h5IGRvIHlvdSBuZWVkIGJvdGggc3lzZnMgYW5kIFFNUCBhdCB0aGUgc2Ft
ZSB0aW1lPyBJIGNhbiBzZWUgaXQgZ2l2ZXMgdXMgc29tZQpmbGV4aWJpbGl0eSwgYnV0IGlzIHRo
ZXJlIHNvbWV0aGluZyBtb3JlIHRvIHRoYXQ/CgpOb3JtYWxseSwgSSdkIHByZWZlciBhIFFNUCBp
bnRlcmZhY2UgZnJvbSBsaWJ2aXJ0J3MgcGVyc3BlY3RpdmUgKHdpdGggYW4KYXBwcm9wcmlhdGUg
Y2FwYWJpbGl0eSB0aGF0IGxpYnZpcnQgY2FuIGNoZWNrIGZvciBRRU1VIHN1cHBvcnQpIGJlY2F1
c2UgSSBpbWFnaW5lIGxhcmdlIG5vZGVzIGhhdmluZyBhCmJ1bmNoIG9mIEdQVXMgd2l0aCBkaWZm
ZXJlbnQgcmV2aXNpb25zIHdoaWNoIG1pZ2h0IG5vdCBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZS4K
TGlidmlydCBtaWdodCBxdWVyeSB0aGUgdmVyc2lvbiBzdHJpbmcgb24gc291cmNlIGFuZCBjaGVj
ayBpdCBvbiBkZXN0IHZpYSB0aGUKUU1QIGluIGEgd2F5IHRoYXQgUUVNVSwgdGFsa2luZyB0byB0
aGUgZHJpdmVyLCB3b3VsZCByZXR1cm4gZWl0aGVyIGEgbGlzdCBvciBhCnNpbmdsZSBwaHlzaWNh
bCBkZXZpY2UgdG8gd2hpY2ggd2UgY2FuIG1pZ3JhdGUsIGJlY2F1c2UgbmVpdGhlciBRRU1VIG5v
cgpsaWJ2aXJ0IGtub3cgdGhhdCwgb25seSB0aGUgZHJpdmVyIGRvZXMsIHNvIHRoYXQncyBhbiBp
bXBvcnRhbnQgaW5mb3JtYXRpb24KcmF0aGVyIHRoYW4gbG9vcGluZyB0aHJvdWdoIGFsbCB0aGUg
ZGV2aWNlcyBhbmQgdHJ5aW5nIHRvIGZpbmQgb25lIHRoYXQgaXMKY29tcGF0aWJsZS4gSG93ZXZl
ciwgeW91IG1pZ2h0IGhhdmUgYSBoYXJkIHRpbWUgbWFraW5nIGFsbCB0aGUgbmVjZXNzYXJ5CmNo
YW5nZXMgaW4gUU1QIGludHJvc3BlY3RhYmxlLCBhIG5ldyBjb21tYW5kIHdvdWxkIGJlIGZpbmUs
IGJ1dCBpZiB5b3UgYWxzbwp3YW50ZWQgdG8gZXh0ZW5kIHNheSB2ZmlvLXBjaSBvcHRpb25zLCBJ
SVJDIHRoYXQgd291bGQgbm90IGFwcGVhciBpbiB0aGUgUUFQSQpzY2hlbWEgYW5kIGxpYnZpcnQg
d291bGQgbm90IGJlIGFibGUgdG8gZGV0ZWN0IHN1cHBvcnQgZm9yIGl0LgoKT24gdGhlIG90aGVy
IGhhbmQsIHRoZSBwcmVzZW5jZSBvZiBhIFFNUCBpbnRlcmZhY2UgSU1PIGRvZXNuJ3QgaGVscCBt
Z210IGFwcHMKbXVjaCwgYXMgaXQgc3RpbGwgY2FycmllcyB0aGUgYnVyZGVuIG9mIGJlaW5nIGFi
bGUgdG8gY2hlY2sgdGhpcyBvbmx5IGF0IHRoZQp0aW1lIG9mIG1pZ3JhdGlvbiwgd2hpY2ggZS5n
LiBPcGVuU3RhY2sgd291bGQgbGlrZSB0byBrbm93IGxvbmcgYmVmb3JlIHRoYXQuCgpTbywgaGF2
aW5nIHN5c2ZzIGF0dHJpYnV0ZXMgd291bGQgd29yayBmb3IgYm90aCBsaWJ2aXJ0IChldmVuIHRo
b3VnaCBsaWJ2aXJ0CndvdWxkIGJlbmVmaXQgZnJvbSBhIFFNUCBtdWNoIG1vcmUpIGFuZCBPcGVu
U3RhY2suIE9wZW5TdGFjayB3b3VsZCBJTU8gdGhlbgpoYXZlIHRvIGZpZ3VyZSBvdXQgaG93IHRv
IGNyZWF0ZSB0aGUgbWFwcGluZ3MgYmV0d2VlbiBjb21wYXRpYmxlIGRldmljZXMgYWNyb3NzCnNl
dmVyYWwgbm9kZXMgd2hpY2ggYXJlIG5vbi11bmlmb3JtLgoKUmVnYXJkcywKRXJpawpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
