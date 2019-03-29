// Initial wiring: [13, 9, 2, 14, 0, 8, 6, 3, 19, 10, 1, 16, 5, 7, 11, 18, 12, 4, 15, 17]
// Resulting wiring: [13, 9, 2, 14, 0, 8, 6, 3, 19, 10, 1, 16, 5, 7, 11, 18, 12, 4, 15, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[1];
cx q[9], q[0];
cx q[13], q[7];
cx q[14], q[13];
cx q[13], q[7];
cx q[14], q[5];
cx q[14], q[15];
cx q[13], q[15];
cx q[12], q[17];
cx q[12], q[13];
cx q[11], q[18];
cx q[10], q[11];
cx q[11], q[12];
cx q[9], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[9], q[10];
cx q[11], q[9];
cx q[8], q[10];
