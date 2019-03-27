Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp6495845ywb;
        Wed, 27 Mar 2019 15:10:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybBVTNsLtMhVWXp3VYEZLSzoB7NMNCyroy4pd3tHvwNaTd7NmDvhCIOY4lx/SzlJ3tvI8q
X-Received: by 2002:a17:902:3f83:: with SMTP id a3mr37325952pld.6.1553724626763;
        Wed, 27 Mar 2019 15:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553724626; cv=none;
        d=google.com; s=arc-20160816;
        b=mziCKDF4KIuzGS4mdWBldaEZAf7Chdt/Yo9D/pHUvWWqW/dQeaj7tKDVfSqbBLkm/i
         Oz83RFr+gZS+YawV4crbkvTFoFlfR411PXvBVhV1TNnj1OUYvYsP9R82pehhU8F3I2ae
         Qx2eWCYw+VtWcQBeO6kZQ/PMBjocKNw9d4fhiN47MdsjOE3m70M60k430yDPdZXu7Kh/
         9KuEaK2iBQueN/XdpPSgPG6VUby3y9/MclWsBwWXX9N0Wf1iNtCdpeovqmdOXcZwZaDk
         6WrBEx73AFcRfzNMMB9W/qfj5K1lRBMp5A5ckr0JFna6lRc2EWUON7v4lzevV7sgTWq/
         qOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=vn8Yx4avJRwupTtAh+ef3O5/Kp59a89lFPqIf6pUSfc=;
        b=yLgzrNLsPrvUk751oZ4vWc+deEo+zdtHk5UHmM3VZdVCgKR+E6qAw/G3I7+MNtVcIe
         qT7BU9AJj2lYo/2GLaufyaCybblxQV6MI/jLX9zvY4W3p20+WlqdrhAh5v1RidkmrCBR
         YZqAqNvMnBZtua1gpXdrCIacpy2xGq4K/xuoSUdty5g29ZaC1mnqRYyjZaog+uXb4GG3
         jZgEu1EdzaQ0cqYajYkO82nnvk7pHQBhpAfV5eZJN2S06iBQjh62+2r8meRspxgiQ3Kv
         u4XgbnV71nz+VM77LALuRGbmvFqaX9rF88vbvzcVLcd61gkedC8swGX4Rkshd8s4qPeK
         KC9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id t22si20068157plo.79.2019.03.27.15.10.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 15:10:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09856E2AC;
	Wed, 27 Mar 2019 22:10:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB2E6E2AA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 22:10:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DB601C0568E0;
 Wed, 27 Mar 2019 22:10:23 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B3CF9CB0;
 Wed, 27 Mar 2019 22:10:21 +0000 (UTC)
Date: Wed, 27 Mar 2019 16:10:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190327161020.1c013e65@x1.home>
In-Reply-To: <20190327201854.GG2636@work-vm>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 27 Mar 2019 22:10:24 +0000 (UTC)
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
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Zhao Yan <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBNYXIgMjAxOSAyMDoxODo1NCArMDAwMAoiRHIuIERhdmlkIEFsYW4gR2lsYmVy
dCIgPGRnaWxiZXJ0QHJlZGhhdC5jb20+IHdyb3RlOgoKPiAqIFpoYW8gWWFuICh5YW4ueS56aGFv
QGludGVsLmNvbSkgd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAyMCwgMjAxOSBhdCAwNzo0Mjo0MlBN
ICswODAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOiAgCj4gPiA+ID4gPiA+ID4gICBiKSBIb3cgZG8g
d2UgZGV0ZWN0IGlmIHdlJ3JlIG1pZ3JhdGluZyBmcm9tL3RvIHRoZSB3cm9uZyBkZXZpY2Ugb3IK
PiA+ID4gPiA+ID4gPiB2ZXJzaW9uIG9mIGRldmljZT8gIE9yIHNheSB0byBhIGRldmljZSB3aXRo
IG9sZGVyIGZpcm13YXJlIG9yIHBlcmhhcHMKPiA+ID4gPiA+ID4gPiBhIGRldmljZSB0aGF0IGhh
cyBsZXNzIGRldmljZSBtZW1vcnkgPyAgICAKPiA+ID4gPiA+ID4gQWN0dWFsbHkgaXQncyBzdGls
bCBhbiBvcGVuIGZvciBWRklPIG1pZ3JhdGlvbi4gTmVlZCB0byB0aGluayBhYm91dAo+ID4gPiA+
ID4gPiB3aGV0aGVyIGl0J3MgYmV0dGVyIHRvIGNoZWNrIHRoYXQgaW4gbGlidmlydCBvciBxZW11
IChsaWtlIGEgZGV2aWNlIG1hZ2ljCj4gPiA+ID4gPiA+IGFsb25nIHdpdGggdmVyaW9uID8pLiAg
ICAKPiA+ID4gPiAKPiA+ID4gPiBXZSBtdXN0IGtlZXAgdGhlIGhhcmR3YXJlIGdlbmVyYXRpb24g
aXMgdGhlIHNhbWUgd2l0aCBvbmUgUE9EIG9mIHB1YmxpYyBjbG91ZAo+ID4gPiA+IHByb3ZpZGVy
cy4gQnV0IHdlIHN0aWxsIHRoaW5rIGFib3V0IHRoZSBsaXZlIG1pZ3JhdGlvbiBiZXR3ZWVuIGZy
b20gdGhlIHRoZSBsb3dlcgo+ID4gPiA+IGdlbmVyYXRpb24gb2YgaGFyZHdhcmUgbWlncmF0ZWQg
dG8gdGhlIGhpZ2hlciBnZW5lcmF0aW9uLiAgCj4gPiA+IAo+ID4gPiBBZ3JlZWQsIGxvd2VyLT5o
aWdoZXIgaXMgdGhlIG9uZSBkaXJlY3Rpb24gdGhhdCBtaWdodCBtYWtlIHNlbnNlIHRvCj4gPiA+
IHN1cHBvcnQuCj4gPiA+IAo+ID4gPiBCdXQgcmVnYXJkbGVzcyBvZiB0aGF0LCBJIHRoaW5rIHdl
IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgaW5jb21wYXRpYmxlCj4gPiA+IGRldmljZXMvdmVyc2lv
bnMgZmFpbCBkaXJlY3RseSBpbnN0ZWFkIG9mIGZhaWxpbmcgaW4gYSBzdWJ0bGUsIGhhcmQgdG8K
PiA+ID4gZGVidWcgd2F5LiBNaWdodCBiZSB1c2VmdWwgdG8gZG8gc29tZSBpbml0aWFsIHNhbml0
eSBjaGVja3MgaW4gbGlidmlydAo+ID4gPiBhcyB3ZWxsLgo+ID4gPiAKPiA+ID4gSG93IGVhc3kg
aXMgaXQgdG8gb2J0YWluIHRoYXQgaW5mb3JtYXRpb24gaW4gYSBmb3JtIHRoYXQgY2FuIGJlCj4g
PiA+IGNvbnN1bWVkIGJ5IGhpZ2hlciBsYXllcnM/IENhbiB3ZSBmaW5kIG91dCB0aGUgZGV2aWNl
IHR5cGUgYXQgbGVhc3Q/Cj4gPiA+IFdoYXQgYWJvdXQgc29tZSBraW5kIG9mIHJldmlzaW9uPyAg
Cj4gPiBoaSBBbGV4IGFuZCBDb3JuZWxpYQo+ID4gZm9yIGRldmljZSBjb21wYXRpYmlsaXR5LCBk
byB5b3UgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byB1c2UgInZlcnNpb24iCj4gPiBhbmQgImRl
dmljZSB2ZXJzaW9uIiBmaWVsZHM/Cj4gPiAKPiA+IHZlcnNpb24gZmllbGQ6IGlkZW50aWZ5IGxp
dmUgbWlncmF0aW9uIGludGVyZmFjZSdzIHZlcnNpb24uIGl0IGNhbiBoYXZlIGEKPiA+IHNvcnQg
b2YgYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgbGlrZSB0YXJnZXQgbWFjaGluZSdzIHZlcnNpb24g
Pj0gc291cmNlCj4gPiBtYWNoaW5lJ3MgdmVyc2lvbi4gc29tZXRoaW5nIGxpa2UgdGhhdC4KCkRv
bid0IHdlIGVzc2VudGlhbGx5IGFscmVhZHkgaGF2ZSB0aGlzIHZpYSB0aGUgZGV2aWNlIHNwZWNp
ZmljIHJlZ2lvbj8KVGhlIHN0cnVjdCB2ZmlvX2luZm9fY2FwX2hlYWRlciBpbmNsdWRlcyBpZCBh
bmQgdmVyc2lvbiBmaWVsZHMsIHNvIHdlCmNhbiBkZWNsYXJlIGEgbWlncmF0aW9uIGlkIGFuZCBp
bmNyZW1lbnQgdGhlIHZlcnNpb24gZm9yIGFueQppbmNvbXBhdGlibGUgY2hhbmdlcyB0byB0aGUg
cHJvdG9jb2wuCgo+ID4gCj4gPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28gcGFy
dHM6Cj4gPiAxLiB2ZW5kb3IgaWQgOiBpdCB0YWtlcyAzMiBiaXRzLiBlLmcuIDB4ODA4Ni4KCldo
byBhbGxvY2F0ZXMgSURzPyAgSWYgd2UncmUgZ29pbmcgdG8gdXNlIFBDSSB2ZW5kb3IgSURzLCB0
aGVuIEknZApzdWdnZXN0IHdlIHVzZSBhIGJpdCB0byBmbGFnIGl0IGFzIHN1Y2ggc28gd2UgY2Fu
IHJlc2VydmUgdGhhdCBwb3J0aW9uCm9mIHRoZSAzMmJpdCBhZGRyZXNzIHNwYWNlLiAgU2VlIGZv
ciBleGFtcGxlOgoKI2RlZmluZSBWRklPX1JFR0lPTl9UWVBFX1BDSV9WRU5ET1JfVFlQRSAgICAg
ICAgKDEgPDwgMzEpCiNkZWZpbmUgVkZJT19SRUdJT05fVFlQRV9QQ0lfVkVORE9SX01BU0sgICAg
ICAgICgweGZmZmYpCgpGb3IgdmVuZG9yIHNwZWNpZmljIHJlZ2lvbnMuCgo+ID4gMi4gdmVuZG9y
IHByb3ByaWV0YXJ5IHN0cmluZzogaXQgY2FuIGJlIGFueSBzdHJpbmcgdGhhdCBhIHZlbmRvciBk
cml2ZXIKPiA+IHRoaW5rcyBjYW4gaWRlbnRpZnkgYSBzb3VyY2UgZGV2aWNlLiBlLmcuIHBjaWlk
ICsgbWRldiB0eXBlLgo+ID4gInZlbmRvciBpZCIgaXMgdG8gYXZvaWQgb3ZlcmxhcCBvZiAidmVu
ZG9yIHByb3ByaWV0YXJ5IHN0cmluZyIuCj4gPiAKPiA+IAo+ID4gc3RydWN0IHZmaW9fZGV2aWNl
X3N0YXRlX2N0bCB7Cj4gPiAgICAgIF9fdTMyIHZlcnNpb247ICAgICAgICAgICAgLyogcm8gKi8K
PiA+ICAgICAgX191OCBkZXZpY2VfdmVyc2lvbltNQVhfREVWSUNFX1ZFUlNJT05fTEVOXTsgICAg
ICAgICAgICAvKiBybyAqLwo+ID4gICAgICBzdHJ1Y3Qgewo+ID4gICAgICAJX191MzIgYWN0aW9u
OyAvKiBHRVRfQlVGRkVSLCBTRVRfQlVGRkVSLCBJU19DT01QQVRJQkxFKi8KPiA+IAkuLi4KPiA+
ICAgICAgfWRhdGE7Cj4gPiAgICAgIC4uLgo+ID4gIH07CgpXZSBoYXZlIGEgYnVmZmVyIGFyZWEg
d2hlcmUgd2UgY2FuIHJlYWQgYW5kIHdyaXRlIGRhdGEgZnJvbSB0aGUgdmVuZG9yCmRyaXZlciwg
d2h5IHdvdWxkIHdlIGhhdmUgdGhpcyBJU19DT01QQVRJQkxFIHByb3RvY29sIHRvIHdyaXRlIHRo
ZQpkZXZpY2UgdmVyc2lvbiBzdHJpbmcgYnV0IHVzZSBhIHN0YXRpYyBmaXhlZCBsZW5ndGggdmVy
c2lvbiBzdHJpbmcgaW4KdGhlIGNvbnRyb2wgaGVhZGVyIHRvIHJlYWQgaXQ/ICBJT1csIGxldCdz
IHVzZSBHRVRfVkVSU0lPTiwKQ0hFQ0tfVkVSU0lPTiBhY3Rpb25zIHRoYXQgbWFrZSB1c2Ugb2Yg
dGhlIGJ1ZmZlciBhcmVhIGFuZCBhbGxvdyB2ZW5kb3IKc3BlY2lmaWMgdmVyc2lvbiBpbmZvcm1h
dGlvbiBsZW5ndGguCgo+ID4gCj4gPiBUaGVuLCBhbiBhY3Rpb24gSVNfQ09NUEFUSUJMRSBpcyBh
ZGRlZCB0byBjaGVjayBkZXZpY2UgY29tcGF0aWJpbGl0eS4KPiA+IAo+ID4gVGhlIGZsb3cgdG8g
ZmlndXJlIG91dCB3aGV0aGVyIGEgc291cmNlIGRldmljZSBpcyBtaWdyYXRhYmxlIHRvIHRhcmdl
dCBkZXZpY2UKPiA+IGlzIGxpa2UgdGhhdDoKPiA+IDEuIGluIHNvdXJjZSBzaWRlJ3MgLnNhdmVf
c2V0dXAsIHNhdmUgc291cmNlIGRldmljZSdzIGRldmljZV92ZXJzaW9uIHN0cmluZwo+ID4gMi4g
aW4gdGFyZ2V0IHNpZGUncyAubG9hZF9zdGF0ZSwgbG9hZCBzb3VyY2UgZGV2aWNlJ3MgZGV2aWNl
IHZlcnNpb24gc3RyaW5nCj4gPiBhbmQgd3JpdGUgaXQgdG8gZGF0YSByZWdpb24sIGFuZCBjYWxs
IElTX0NPTVBBVElCTEUgYWN0aW9uIHRvIGFzayB2ZW5kb3IgZHJpdmVyCj4gPiB0byBjaGVjayB3
aGV0aGVyIHRoZSBzb3VyY2UgZGV2aWNlIGlzIGNvbXBhdGlibGUgdG8gaXQuCj4gPiAKPiA+IFRo
ZSBhZHZhbnRhZ2Ugb2YgYWRkaW5nIGFuIElTX0NPTVBBVElCTEUgYWN0aW9uIGlzIHRoYXQsIHZl
bmRvciBkcml2ZXIgY2FuCj4gPiBtYWludGFpbiBhIGNvbXBhdGliaWxpdHkgdGFibGUgYW5kIGRl
Y2lkZSB3aGV0aGVyIHNvdXJjZSBkZXZpY2UgaXMgY29tcGF0aWJsZQo+ID4gdG8gdGFyZ2V0IGRl
dmljZSBhY2NvcmRpbmcgdG8gaXRzIHByb3ByaWV0YXJ5IHRhYmxlLgo+ID4gSW4gZGV2aWNlX3Zl
cnNpb24gc3RyaW5nLCB2ZW5kb3IgZHJpdmVyIG9ubHkgaGFzIHRvIGRlc2NyaWJlIHRoZSBzb3Vy
Y2UKPiA+IGRldmljZSBhcyBlbGFib3JhdGVseSBhcyBwb3NzaWJsZSBhbmQgcmVzb3J0cyB0byB2
ZW5kb3IgZHJpdmVyIGluIHRhcmdldCBzaWRlCj4gPiB0byBmaWd1cmUgb3V0IHdoZXRoZXIgdGhl
eSBhcmUgY29tcGF0aWJsZS4gIAoKSSBhZ3JlZSwgaXQncyB0b28gY29tcGxpY2F0ZWQgYW5kIHJl
c3RyaWN0aXZlIHRvIHRyeSB0byBjcmVhdGUgYW4KaW50ZXJmYWNlIGZvciB0aGUgdXNlciB0byBk
ZXRlcm1pbmUgY29tcGF0aWJpbGl0eSwgbGV0IHRoZSBkcml2ZXIKZGVjbGFyZSBpdCBjb21wYXRp
YmxlIG9yIG5vdC4KCj4gSXQgd291bGQgYWxzbyBiZSBnb29kIGlmIHRoZSAnSVNfQ09NUEFUSUJM
RScgd2FzIHNvbWVob3cgY2FsbGFibGUKPiBleHRlcm5hbGx5IC0gc28gd2UgY291bGQgYmUgYWJs
ZSB0byBhbnN3ZXIgYSBxdWVzdGlvbiBsaWtlICdjYW4gd2UKPiBtaWdyYXRlIHRoaXMgVk0gdG8g
dGhpcyBob3N0JyAtIGZyb20gdGhlIG1hbmFnZW1lbnQgbGF5ZXIgYmVmb3JlIGl0Cj4gYWN0dWFs
bHkgc3RhcnRzIHRoZSBtaWdyYXRpb24uCgpJIHRoaW5rIHdlJ2QgbmVlZCB0byBtaXJyb3IgdGhp
cyBjYXBhYmlsaXR5IGluIHN5c2ZzIHRvIHN1cHBvcnQgdGhhdCwKb3IgY3JlYXRlIGEgcW1wIGlu
dGVyZmFjZSB0aHJvdWdoIFFFTVUgdGhhdCB0aGUgZGV2aWNlIG93bmVyIGNvdWxkIG1ha2UKdGhl
IHJlcXVlc3Qgb24gYmVoYWxmIG9mIHRoZSBtYW5hZ2VtZW50IGxheWVyLiAgR2V0dGluZyBhY2Nl
c3MgdG8gdGhlCnZmaW8gZGV2aWNlIHJlcXVpcmVzIGFuIGlvbW11IGNvbnRleHQgdGhhdCdzIGFs
cmVhZHkgaW4gdXNlIGJ5IHRoZQpkZXZpY2Ugb3duZXIsIHdlIGhhdmUgbm8gaW50ZW50aW9uIG9m
IHN1cHBvcnRpbmcgYSBtb2RlbCB0aGF0IGFsbG93cwppbmRlcGVuZGVudCB0YXNrcyBhY2Nlc3Mg
dG8gYSBkZXZpY2UuICBUaGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
