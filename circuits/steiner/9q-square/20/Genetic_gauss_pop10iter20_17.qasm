// Initial wiring: [0 1 2 3 4 6 7 5 8]
// Resulting wiring: [1 0 2 7 4 6 3 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[0];
cx q[1], q[0];
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];
cx q[8], q[3];
cx q[7], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[2];
cx q[8], q[3];
cx q[8], q[3];
cx q[2], q[3];
cx q[7], q[6];
