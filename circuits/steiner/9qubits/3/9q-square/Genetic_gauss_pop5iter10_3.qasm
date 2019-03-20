// Initial wiring: [0 4 2 3 7 1 6 5 8]
// Resulting wiring: [0 4 2 3 7 1 6 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[0];
cx q[3], q[2];
