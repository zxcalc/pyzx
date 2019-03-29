// Initial wiring: [17, 16, 3, 12, 18, 14, 8, 6, 1, 2, 11, 10, 19, 9, 0, 7, 13, 4, 15, 5]
// Resulting wiring: [17, 16, 3, 12, 18, 14, 8, 6, 1, 2, 11, 10, 19, 9, 0, 7, 13, 4, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[7], q[1];
cx q[9], q[8];
cx q[8], q[2];
cx q[9], q[8];
cx q[12], q[11];
cx q[17], q[12];
cx q[17], q[11];
cx q[18], q[11];
cx q[11], q[9];
cx q[16], q[17];
cx q[15], q[16];
cx q[16], q[17];
cx q[17], q[16];
cx q[13], q[14];
cx q[12], q[18];
cx q[12], q[13];
cx q[7], q[13];
cx q[7], q[8];
cx q[0], q[1];
