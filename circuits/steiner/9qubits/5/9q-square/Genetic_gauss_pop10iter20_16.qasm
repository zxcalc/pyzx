// Initial wiring: [0 1 2 8 4 5 7 6 3]
// Resulting wiring: [0 2 1 4 3 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[8], q[3];
cx q[8], q[3];
cx q[8], q[3];
cx q[4], q[1];
cx q[7], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[7], q[8];
cx q[7], q[4];
