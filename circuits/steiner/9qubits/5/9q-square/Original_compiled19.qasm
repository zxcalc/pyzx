// Initial wiring: [0 2 3 1 4 5 6 7 8]
// Resulting wiring: [0 2 3 1 7 5 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[4];
cx q[4], q[1];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[1], q[4];
cx q[7], q[6];
