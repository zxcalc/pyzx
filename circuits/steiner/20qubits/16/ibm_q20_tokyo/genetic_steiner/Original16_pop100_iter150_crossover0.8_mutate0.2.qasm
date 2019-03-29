// Initial wiring: [6, 18, 9, 13, 11, 16, 1, 3, 15, 8, 12, 10, 17, 0, 4, 7, 5, 2, 14, 19]
// Resulting wiring: [6, 18, 9, 13, 11, 16, 1, 3, 15, 8, 12, 10, 17, 0, 4, 7, 5, 2, 14, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[1];
cx q[10], q[8];
cx q[11], q[9];
cx q[13], q[6];
cx q[6], q[3];
cx q[14], q[5];
cx q[5], q[3];
cx q[3], q[2];
cx q[15], q[13];
cx q[13], q[7];
cx q[16], q[13];
cx q[16], q[15];
cx q[13], q[7];
cx q[16], q[17];
cx q[14], q[16];
cx q[16], q[17];
cx q[11], q[18];
cx q[10], q[19];
cx q[5], q[6];
