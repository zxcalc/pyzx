// Initial wiring: [0 1 2 7 3 5 6 4 8]
// Resulting wiring: [0 1 2 4 7 5 6 8 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[3];
cx q[4], q[3];
cx q[4], q[3];
cx q[6], q[7];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[6], q[7];
cx q[4], q[7];
cx q[1], q[4];
cx q[3], q[2];
