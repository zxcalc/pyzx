// Initial wiring: [17, 13, 1, 0, 18, 2, 8, 15, 10, 19, 9, 16, 7, 5, 14, 4, 12, 11, 3, 6]
// Resulting wiring: [17, 13, 1, 0, 18, 2, 8, 15, 10, 19, 9, 16, 7, 5, 14, 4, 12, 11, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[6], q[3];
cx q[8], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[8], q[2];
cx q[11], q[8];
cx q[8], q[7];
cx q[12], q[6];
cx q[6], q[4];
cx q[17], q[12];
cx q[12], q[6];
cx q[18], q[19];
cx q[17], q[18];
cx q[13], q[15];
cx q[12], q[13];
cx q[9], q[11];
cx q[9], q[10];
cx q[8], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[2], q[8];
cx q[8], q[11];
